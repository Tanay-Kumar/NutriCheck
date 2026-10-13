import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
  static CreateChatCompletionTextCall createChatCompletionTextCall =
      CreateChatCompletionTextCall();
  static CreateCompletionCall createCompletionCall = CreateCompletionCall();
  static CreateImageCall createImageCall = CreateImageCall();
  static CreateImageEditCall createImageEditCall = CreateImageEditCall();
  static CreateImageVariationCall createImageVariationCall =
      CreateImageVariationCall();
  static CreateEmbeddingCall createEmbeddingCall = CreateEmbeddingCall();
  static CreateSpeechCall createSpeechCall = CreateSpeechCall();
  static CreateTranscriptionCall createTranscriptionCall =
      CreateTranscriptionCall();
  static CreateTranslationCall createTranslationCall = CreateTranslationCall();
  static ListFilesCall listFilesCall = ListFilesCall();
  static CreateFileCall createFileCall = CreateFileCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static RetrieveFileCall retrieveFileCall = RetrieveFileCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static CreateUploadCall createUploadCall = CreateUploadCall();
  static AddUploadPartCall addUploadPartCall = AddUploadPartCall();
  static CompleteUploadCall completeUploadCall = CompleteUploadCall();
  static CancelUploadCall cancelUploadCall = CancelUploadCall();
  static CreateFineTuningJobCall createFineTuningJobCall =
      CreateFineTuningJobCall();
  static ListPaginatedFineTuningJobsCall listPaginatedFineTuningJobsCall =
      ListPaginatedFineTuningJobsCall();
  static RetrieveFineTuningJobCall retrieveFineTuningJobCall =
      RetrieveFineTuningJobCall();
  static ListFineTuningEventsCall listFineTuningEventsCall =
      ListFineTuningEventsCall();
  static CancelFineTuningJobCall cancelFineTuningJobCall =
      CancelFineTuningJobCall();
  static ListFineTuningJobCheckpointsCall listFineTuningJobCheckpointsCall =
      ListFineTuningJobCheckpointsCall();
  static ListModelsCall listModelsCall = ListModelsCall();
  static RetrieveModelCall retrieveModelCall = RetrieveModelCall();
  static DeleteModelCall deleteModelCall = DeleteModelCall();
  static CreateModerationCall createModerationCall = CreateModerationCall();
  static ListAssistantsCall listAssistantsCall = ListAssistantsCall();
  static CreateAssistantCall createAssistantCall = CreateAssistantCall();
  static GetAssistantCall getAssistantCall = GetAssistantCall();
  static ModifyAssistantCall modifyAssistantCall = ModifyAssistantCall();
  static DeleteAssistantCall deleteAssistantCall = DeleteAssistantCall();
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static GetThreadCall getThreadCall = GetThreadCall();
  static ModifyThreadCall modifyThreadCall = ModifyThreadCall();
  static DeleteThreadCall deleteThreadCall = DeleteThreadCall();
  static ListMessagesCall listMessagesCall = ListMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static GetMessageCall getMessageCall = GetMessageCall();
  static ModifyMessageCall modifyMessageCall = ModifyMessageCall();
  static DeleteMessageCall deleteMessageCall = DeleteMessageCall();
  static CreateThreadAndRunCall createThreadAndRunCall =
      CreateThreadAndRunCall();
  static ListRunsCall listRunsCall = ListRunsCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static GetRunCall getRunCall = GetRunCall();
  static ModifyRunCall modifyRunCall = ModifyRunCall();
  static SubmitToolOuputsToRunCall submitToolOuputsToRunCall =
      SubmitToolOuputsToRunCall();
  static CancelRunCall cancelRunCall = CancelRunCall();
  static ListRunStepsCall listRunStepsCall = ListRunStepsCall();
  static GetRunStepCall getRunStepCall = GetRunStepCall();
  static ListVectorStoresCall listVectorStoresCall = ListVectorStoresCall();
  static CreateVectorStoreCall createVectorStoreCall = CreateVectorStoreCall();
  static GetVectorStoreCall getVectorStoreCall = GetVectorStoreCall();
  static ModifyVectorStoreCall modifyVectorStoreCall = ModifyVectorStoreCall();
  static DeleteVectorStoreCall deleteVectorStoreCall = DeleteVectorStoreCall();
  static ListVectorStoreFilesCall listVectorStoreFilesCall =
      ListVectorStoreFilesCall();
  static CreateVectorStoreFileCall createVectorStoreFileCall =
      CreateVectorStoreFileCall();
  static GetVectorStoreFileCall getVectorStoreFileCall =
      GetVectorStoreFileCall();
  static DeleteVectorStoreFileCall deleteVectorStoreFileCall =
      DeleteVectorStoreFileCall();
  static CreateVectorStoreFileBatchCall createVectorStoreFileBatchCall =
      CreateVectorStoreFileBatchCall();
  static GetVectorStoreFileBatchCall getVectorStoreFileBatchCall =
      GetVectorStoreFileBatchCall();
  static CancelVectorStoreFileBatchCall cancelVectorStoreFileBatchCall =
      CancelVectorStoreFileBatchCall();
  static ListFilesInVectorStoreBatchCall listFilesInVectorStoreBatchCall =
      ListFilesInVectorStoreBatchCall();
  static CreateBatchCall createBatchCall = CreateBatchCall();
  static ListBatchesCall listBatchesCall = ListBatchesCall();
  static RetrieveBatchCall retrieveBatchCall = RetrieveBatchCall();
  static CancelBatchCall cancelBatchCall = CancelBatchCall();
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? imageUrl = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateChatCompletionCall',
        'variables': {
          'query': query,
          'imageUrl': imageUrl,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? resText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateChatCompletionTextCall {
  Future<ApiCallResponse> call({
    dynamic? messagesJson,
    String? apiKey =
        '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',
  }) async {
    final messages = _serializeJson(messagesJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateChatCompletionTextCall',
        'variables': {
          'messages': messages,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? resTextPrompt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateCompletionCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageEditCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageVariationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageVariationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateEmbeddingCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateEmbeddingCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateSpeechCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateSpeechCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateTranscriptionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateTranscriptionCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateTranslationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateTranslationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFilesCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFilesCall',
        'variables': {
          'purpose': purpose,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateFileCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateFileCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DownloadFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateUploadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateUploadCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AddUploadPartCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AddUploadPartCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CompleteUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CompleteUploadCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelUploadCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateFineTuningJobCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListPaginatedFineTuningJobsCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListPaginatedFineTuningJobsCall',
        'variables': {
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveFineTuningJobCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFineTuningEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFineTuningEventsCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelFineTuningJobCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFineTuningJobCheckpointsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFineTuningJobCheckpointsCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListModelsCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListModelsCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveModelCall',
        'variables': {
          'model': model,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteModelCall',
        'variables': {
          'model': model,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateModerationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateModerationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListAssistantsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListAssistantsCall',
        'variables': {
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateAssistantCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateAssistantCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateThreadCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListMessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListMessagesCall',
        'variables': {
          'threadId': threadId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateMessageCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateThreadAndRunCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateThreadAndRunCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListRunsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListRunsCall',
        'variables': {
          'threadId': threadId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateRunCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SubmitToolOuputsToRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubmitToolOuputsToRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListRunStepsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListRunStepsCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetRunStepCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? stepId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetRunStepCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'stepId': stepId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListVectorStoresCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListVectorStoresCall',
        'variables': {
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListVectorStoreFilesCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListVectorStoreFilesCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'filter': filter,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFilesInVectorStoreBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFilesInVectorStoreBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'filter': filter,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateBatchCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateBatchCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListBatchesCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListBatchesCall',
        'variables': {
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveBatchCall',
        'variables': {
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelBatchCall',
        'variables': {
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End OpenAI API Group Code

class HealthScoreCall {
  static Future<ApiCallResponse> call({
    String? messages = '',
    String? apiKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "messages": ${messages == null ? 'null' : '"${messages}"'},
  "apiKey": ${apiKey == null ? 'null' : '"${apiKey}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Health score',
      apiUrl: 'https://testnutriapp-zvvh7x654q-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sk-proj-hmH2TVOfdMbGEzhoxHllT3BlbkFJOujS6LtafpQeCU0MRT8b',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
