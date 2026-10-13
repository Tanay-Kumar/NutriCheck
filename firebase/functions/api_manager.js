const axios = require("axios").default;
const qs = require("qs");

/// Start OpenAI API Group Code

function createOpenAIAPIGroup(apiKey) {
  return {
    baseUrl: `https://api.openai.com/v1`,
    headers: {},
  };
}

async function _createChatCompletionCall(context, ffVariables) {
  var query = ffVariables["query"];
  var imageUrl = ffVariables["imageUrl"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/chat/completions`;
  var headers = { Authorization: `Bearer ${apiKey}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o-mini",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": ${query == null ? "null" : `"${query}"`}
        },
        {
          "type": "image_url",
          "image_url": {
            "url": ${imageUrl == null ? "null" : `"${imageUrl}"`}
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createChatCompletionTextCall(context, ffVariables) {
  var messages = ffVariables["messages"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/chat/completions`;
  var headers = {
    Authorization: `Bearer ${apiKey}`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
${messages}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createCompletionCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/completions`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "prompt": "",
  "best_of": 0,
  "echo": false,
  "frequency_penalty": 0,
  "logit_bias": {},
  "logprobs": 0,
  "max_tokens": 16,
  "n": 1,
  "presence_penalty": 0,
  "seed": 0,
  "stop": "",
  "stream": false,
  "stream_options": {
    "include_usage": false
  },
  "suffix": "test.",
  "temperature": 1,
  "top_p": 1,
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/images/generations`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "prompt": "A cute baby sea otter",
  "model": "dall-e-3",
  "n": 1,
  "quality": "standard",
  "response_format": "url",
  "size": "1024x1024",
  "style": "vivid",
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageEditCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/images/edits`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageVariationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/images/variations`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createEmbeddingCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/embeddings`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "input": "The quick brown fox jumped over the lazy dog",
  "model": "text-embedding-3-small",
  "encoding_format": "float",
  "dimensions": 0,
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createSpeechCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/audio/speech`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "input": "",
  "voice": "alloy",
  "response_format": "mp3",
  "speed": 0
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createTranscriptionCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/audio/transcriptions`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createTranslationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/audio/translations`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFilesCall(context, ffVariables) {
  var purpose = ffVariables["purpose"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/files`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { purpose: purpose };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createFileCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/files`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _downloadFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}/content`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createUploadCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/uploads`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "filename": "",
  "purpose": "assistants",
  "bytes": 0,
  "mime_type": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _addUploadPartCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/parts`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _completeUploadCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/complete`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "part_ids": [
    ""
  ],
  "md5": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelUploadCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/cancel`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createFineTuningJobCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-3.5-turbo",
  "training_file": "file-abc123",
  "hyperparameters": {
    "batch_size": "",
    "learning_rate_multiplier": "",
    "n_epochs": ""
  },
  "suffix": "",
  "validation_file": "file-abc123",
  "integrations": [
    {
      "type": "",
      "wandb": {
        "project": "my-wandb-project",
        "name": "",
        "entity": "",
        "tags": [
          "custom-tag"
        ]
      }
    }
  ],
  "seed": 42
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listPaginatedFineTuningJobsCall(context, ffVariables) {
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { after: after, limit: limit };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveFineTuningJobCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFineTuningEventsCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/events`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { after: after, limit: limit };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelFineTuningJobCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/cancel`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFineTuningJobCheckpointsCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/checkpoints`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { after: after, limit: limit };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listModelsCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/models`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveModelCall(context, ffVariables) {
  var model = ffVariables["model"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/models/${model}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteModelCall(context, ffVariables) {
  var model = ffVariables["model"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/models/${model}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createModerationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/moderations`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "input": "",
  "model": "text-moderation-stable"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listAssistantsCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/assistants`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { limit: limit, order: order, after: after, before: before };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createAssistantCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/assistants`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4-turbo",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createThreadCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listMessagesCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {
    limit: limit,
    order: order,
    after: after,
    before: before,
    run_id: runId,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "role": "user",
  "content": "",
  "attachments": [
    {
      "file_id": "",
      "tools": [
        ""
      ]
    }
  ],
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createThreadAndRunCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/runs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "assistant_id": "",
  "thread": {
    "messages": [
      {
        "role": "user",
        "content": "",
        "attachments": [
          {
            "file_id": "",
            "tools": [
              ""
            ]
          }
        ],
        "metadata": {}
      }
    ],
    "tool_resources": {
      "code_interpreter": {
        "file_ids": [
          ""
        ]
      },
      "file_search": {
        "vector_store_ids": [
          ""
        ],
        "vector_stores": [
          {
            "file_ids": [
              ""
            ],
            "chunking_strategy": {},
            "metadata": {}
          }
        ]
      }
    },
    "metadata": {}
  },
  "model": "gpt-4-turbo",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listRunsCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { limit: limit, order: order, after: after, before: before };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "assistant_id": "",
  "model": "gpt-4-turbo",
  "instructions": "",
  "additional_instructions": "",
  "additional_messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tools": [
    ""
  ],
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _submitToolOuputsToRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/submit_tool_outputs`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "tool_outputs": [
    {
      "tool_call_id": "",
      "output": ""
    }
  ],
  "stream": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/cancel`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listRunStepsCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/steps`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { limit: limit, order: order, after: after, before: before };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getRunStepCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var stepId = ffVariables["stepId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/steps/${stepId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listVectorStoresCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { limit: limit, order: order, after: after, before: before };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "file_ids": [
    ""
  ],
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "chunking_strategy": {},
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listVectorStoreFilesCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var filter = ffVariables["filter"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {
    limit: limit,
    order: order,
    after: after,
    before: before,
    filter: filter,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "file_id": "",
  "chunking_strategy": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "file_ids": [
    ""
  ],
  "chunking_strategy": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/cancel`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFilesInVectorStoreBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var filter = ffVariables["filter"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/files`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {
    limit: limit,
    order: order,
    after: after,
    before: before,
    filter: filter,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createBatchCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/batches`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = `
{
  "input_file_id": "",
  "endpoint": "/v1/chat/completions",
  "completion_window": "24h",
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listBatchesCall(context, ffVariables) {
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/batches`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = { after: after, limit: limit };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveBatchCall(context, ffVariables) {
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/batches/${batchId}`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelBatchCall(context, ffVariables) {
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var apiKey = ffVariables["apiKey"];
  const openAIAPIGroup = createOpenAIAPIGroup(apiKey);

  var url = `${openAIAPIGroup.baseUrl}/batches/${batchId}/cancel`;
  var headers = { Authorization: `Bearer ${apiKeyAuth}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End OpenAI API Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    CreateChatCompletionCall: _createChatCompletionCall,
    CreateChatCompletionTextCall: _createChatCompletionTextCall,
    CreateCompletionCall: _createCompletionCall,
    CreateImageCall: _createImageCall,
    CreateImageEditCall: _createImageEditCall,
    CreateImageVariationCall: _createImageVariationCall,
    CreateEmbeddingCall: _createEmbeddingCall,
    CreateSpeechCall: _createSpeechCall,
    CreateTranscriptionCall: _createTranscriptionCall,
    CreateTranslationCall: _createTranslationCall,
    ListFilesCall: _listFilesCall,
    CreateFileCall: _createFileCall,
    DeleteFileCall: _deleteFileCall,
    RetrieveFileCall: _retrieveFileCall,
    DownloadFileCall: _downloadFileCall,
    CreateUploadCall: _createUploadCall,
    AddUploadPartCall: _addUploadPartCall,
    CompleteUploadCall: _completeUploadCall,
    CancelUploadCall: _cancelUploadCall,
    CreateFineTuningJobCall: _createFineTuningJobCall,
    ListPaginatedFineTuningJobsCall: _listPaginatedFineTuningJobsCall,
    RetrieveFineTuningJobCall: _retrieveFineTuningJobCall,
    ListFineTuningEventsCall: _listFineTuningEventsCall,
    CancelFineTuningJobCall: _cancelFineTuningJobCall,
    ListFineTuningJobCheckpointsCall: _listFineTuningJobCheckpointsCall,
    ListModelsCall: _listModelsCall,
    RetrieveModelCall: _retrieveModelCall,
    DeleteModelCall: _deleteModelCall,
    CreateModerationCall: _createModerationCall,
    ListAssistantsCall: _listAssistantsCall,
    CreateAssistantCall: _createAssistantCall,
    GetAssistantCall: _getAssistantCall,
    ModifyAssistantCall: _modifyAssistantCall,
    DeleteAssistantCall: _deleteAssistantCall,
    CreateThreadCall: _createThreadCall,
    GetThreadCall: _getThreadCall,
    ModifyThreadCall: _modifyThreadCall,
    DeleteThreadCall: _deleteThreadCall,
    ListMessagesCall: _listMessagesCall,
    CreateMessageCall: _createMessageCall,
    GetMessageCall: _getMessageCall,
    ModifyMessageCall: _modifyMessageCall,
    DeleteMessageCall: _deleteMessageCall,
    CreateThreadAndRunCall: _createThreadAndRunCall,
    ListRunsCall: _listRunsCall,
    CreateRunCall: _createRunCall,
    GetRunCall: _getRunCall,
    ModifyRunCall: _modifyRunCall,
    SubmitToolOuputsToRunCall: _submitToolOuputsToRunCall,
    CancelRunCall: _cancelRunCall,
    ListRunStepsCall: _listRunStepsCall,
    GetRunStepCall: _getRunStepCall,
    ListVectorStoresCall: _listVectorStoresCall,
    CreateVectorStoreCall: _createVectorStoreCall,
    GetVectorStoreCall: _getVectorStoreCall,
    ModifyVectorStoreCall: _modifyVectorStoreCall,
    DeleteVectorStoreCall: _deleteVectorStoreCall,
    ListVectorStoreFilesCall: _listVectorStoreFilesCall,
    CreateVectorStoreFileCall: _createVectorStoreFileCall,
    GetVectorStoreFileCall: _getVectorStoreFileCall,
    DeleteVectorStoreFileCall: _deleteVectorStoreFileCall,
    CreateVectorStoreFileBatchCall: _createVectorStoreFileBatchCall,
    GetVectorStoreFileBatchCall: _getVectorStoreFileBatchCall,
    CancelVectorStoreFileBatchCall: _cancelVectorStoreFileBatchCall,
    ListFilesInVectorStoreBatchCall: _listFilesInVectorStoreBatchCall,
    CreateBatchCall: _createBatchCall,
    ListBatchesCall: _listBatchesCall,
    RetrieveBatchCall: _retrieveBatchCall,
    CancelBatchCall: _cancelBatchCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
