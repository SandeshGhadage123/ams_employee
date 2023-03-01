import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545";
  final String _privateKey = "11a660b4152da1f1dd6c9467e408f45d5e9238590331d742572e77f66c945f41";

  Web3Client? _web3client;
  bool isLoading = false;

  String? _abiCode;
  EthereumAddress? _contractAddress;

  Credentials? _credentials;

  DeployedContract? _contract;
  ContractFunction? _ipfsHash;
  ContractFunction? _sendHash;
  ContractFunction? _getHash;

  String? deployedName;

  ContractLinking() {
    setup();
  }

  setup() async {
    _web3client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    },);

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString(
        "build/contracts/IPFS.json");
    final jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi['abi']);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']['5777']['address']);
  }

  Future<void> getCredentials() async {
    _credentials = EthPrivateKey.fromHex(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "IPFS"), _contractAddress!);

    _ipfsHash = _contract!.function("ipfsHash");
    _sendHash = _contract!.function("sendHash");
    _getHash = _contract!.function("getHash");
    // getHash();
  }

  // getHash() async {
  //   final _myHash = await _web3client!.call(
  //       contract: _contract!, function: _ipfsHash!, params: []);
  //
  //   deployedName = _myHash[0];
  //   isLoading = false;
  //   notifyListeners();
  // }

  sendHash(String _ipfsHash) async {
    isLoading = true;
    //notifyListeners();
    await _web3client!.sendTransaction(_credentials!, Transaction.callContract(
        contract: _contract!, function: _sendHash!, parameters: [_ipfsHash]));
    // getHash();
  }
}