use v6.c;

use GLib::Raw::Definitions;

unit package Mutter::Raw::Enums;

constant MutterCoglAtlasFlags is export := guint32;
our enum MutterCoglAtlasFlagsEnum is export (
  COGL_ATLAS_CLEAR_TEXTURE     => (1 +< 0),
  COGL_ATLAS_DISABLE_MIGRATION => (1 +< 1),
);

constant MutterCoglAttributeNameID is export := guint32;
our enum MutterCoglAttributeNameIDEnum is export <
  COGL_ATTRIBUTE_NAME_ID_POSITION_ARRAY
  COGL_ATTRIBUTE_NAME_ID_COLOR_ARRAY
  COGL_ATTRIBUTE_NAME_ID_TEXTURE_COORD_ARRAY
  COGL_ATTRIBUTE_NAME_ID_NORMAL_ARRAY
  COGL_ATTRIBUTE_NAME_ID_POINT_SIZE_ARRAY
  COGL_ATTRIBUTE_NAME_ID_CUSTOM_ARRAY
>;

constant MutterCoglAttributeType is export := guint32;
our enum MutterCoglAttributeTypeEnum is export (
  COGL_ATTRIBUTE_TYPE_BYTE           => 0x1400,
  COGL_ATTRIBUTE_TYPE_UNSIGNED_BYTE  => 0x1401,
  COGL_ATTRIBUTE_TYPE_SHORT          => 0x1402,
  COGL_ATTRIBUTE_TYPE_UNSIGNED_SHORT => 0x1403,
  COGL_ATTRIBUTE_TYPE_FLOAT          => 0x1406,
);

constant MutterCoglBitmapError is export := guint32;
our enum MutterCoglBitmapErrorEnum is export <
  COGL_BITMAP_ERROR_FAILED
  COGL_BITMAP_ERROR_UNKNOWN_TYPE
  COGL_BITMAP_ERROR_CORRUPT_IMAGE
>;

constant MutterCoglBlendStringChannelMask is export := guint32;
our enum MutterCoglBlendStringChannelMaskEnum is export <
  COGL_BLEND_STRING_CHANNEL_MASK_RGB
  COGL_BLEND_STRING_CHANNEL_MASK_ALPHA
  COGL_BLEND_STRING_CHANNEL_MASK_RGBA
>;

constant MutterCoglBlendStringColorSourceType is export := guint32;
our enum MutterCoglBlendStringColorSourceTypeEnum is export <
  COGL_BLEND_STRING_COLOR_SOURCE_SRC_COLOR
  COGL_BLEND_STRING_COLOR_SOURCE_DST_COLOR
  COGL_BLEND_STRING_COLOR_SOURCE_CONSTANT
  COGL_BLEND_STRING_COLOR_SOURCE_TEXTURE
  COGL_BLEND_STRING_COLOR_SOURCE_TEXTURE_N
  COGL_BLEND_STRING_COLOR_SOURCE_PRIMARY
  COGL_BLEND_STRING_COLOR_SOURCE_PREVIOUS
>;

constant MutterCoglBlendStringContext is export := guint32;
our enum MutterCoglBlendStringContextEnum is export <
  COGL_BLEND_STRING_CONTEXT_BLENDING
  COGL_BLEND_STRING_CONTEXT_TEXTURE_COMBINE
>;

constant MutterCoglBlendStringError is export := guint32;
our enum MutterCoglBlendStringErrorEnum is export <
  COGL_BLEND_STRING_ERROR_PARSE_ERROR
  COGL_BLEND_STRING_ERROR_ARGUMENT_PARSE_ERROR
  COGL_BLEND_STRING_ERROR_INVALID_ERROR
  COGL_BLEND_STRING_ERROR_GPU_UNSUPPORTED_ERROR
>;

constant MutterCoglBoxedType is export := guint32;
our enum MutterCoglBoxedTypeEnum is export <
  COGL_BOXED_NONE
  COGL_BOXED_INT
  COGL_BOXED_FLOAT
  COGL_BOXED_MATRIX
>;

constant MutterCoglBufferAccess is export := guint32;
our enum MutterCoglBufferAccessEnum is export (
 COGL_BUFFER_ACCESS_READ       => 1,
 COGL_BUFFER_ACCESS_WRITE      => 1 +< 1,
 COGL_BUFFER_ACCESS_READ_WRITE => 1 +| 2  # COGL_BUFFER_ACCESS_READ | COGL_BUFFER_ACCESS_WRITE
);

constant MutterCoglBufferBindTarget is export := guint32;
our enum MutterCoglBufferBindTargetEnum is export <
  COGL_BUFFER_BIND_TARGET_PIXEL_PACK
  COGL_BUFFER_BIND_TARGET_PIXEL_UNPACK
  COGL_BUFFER_BIND_TARGET_ATTRIBUTE_BUFFER
  COGL_BUFFER_BIND_TARGET_INDEX_BUFFER
  COGL_BUFFER_BIND_TARGET_COUNT
>;

constant MutterCoglBufferBit is export := guint64;
our enum MutterCoglBufferBitEnum is export (
  COGL_BUFFER_BIT_COLOR   => 1 +< 0,
  COGL_BUFFER_BIT_DEPTH   => 1 +< 1,
  COGL_BUFFER_BIT_STENCIL => 1 +< 2,
);

constant MutterCoglBufferError is export := guint32;
our enum MutterCoglBufferErrorEnum is export <
  COGL_BUFFER_ERROR_MAP
>;

constant MutterCoglBufferMapHint is export := guint32;
our enum MutterCoglBufferMapHintEnum is export (
  COGL_BUFFER_MAP_HINT_DISCARD       => 1 +< 0,
  COGL_BUFFER_MAP_HINT_DISCARD_RANGE => 1 +< 1,
);

constant MutterCoglBufferTarget is export := guint32;
our enum MutterCoglBufferTargetEnum is export (
  COGL_WINDOW_BUFFER    => (1 +< 1),
  COGL_OFFSCREEN_BUFFER => (1 +< 2),
);

constant MutterCoglBufferUpdateHint is export := guint32;
our enum MutterCoglBufferUpdateHintEnum is export <
  COGL_BUFFER_UPDATE_HINT_STATIC
  COGL_BUFFER_UPDATE_HINT_DYNAMIC
  COGL_BUFFER_UPDATE_HINT_STREAM
>;

constant MutterCoglBufferUsageHint is export := guint32;
our enum MutterCoglBufferUsageHintEnum is export <
  COGL_BUFFER_USAGE_HINT_TEXTURE
  COGL_BUFFER_USAGE_HINT_ATTRIBUTE_BUFFER
  COGL_BUFFER_USAGE_HINT_INDEX_BUFFER
>;

constant MutterCoglClipStackType is export := guint32;
our enum MutterCoglClipStackTypeEnum is export <
  COGL_CLIP_STACK_RECT
  COGL_CLIP_STACK_WINDOW_RECT
  COGL_CLIP_STACK_PRIMITIVE
  COGL_CLIP_STACK_REGION
>;

constant MutterCoglDebugFlags is export := guint32;
our enum MutterCoglDebugFlagsEnum is export <
  COGL_DEBUG_SLICING
  COGL_DEBUG_FRAMEBUFFER
  COGL_DEBUG_OFFSCREEN
  COGL_DEBUG_DRAW
  COGL_DEBUG_PANGO
  COGL_DEBUG_RECTANGLES
  COGL_DEBUG_OBJECT
  COGL_DEBUG_BLEND_STRINGS
  COGL_DEBUG_DISABLE_BATCHING
  COGL_DEBUG_DISABLE_PBOS
  COGL_DEBUG_JOURNAL
  COGL_DEBUG_BATCHING
  COGL_DEBUG_DISABLE_SOFTWARE_TRANSFORM
  COGL_DEBUG_MATRICES
  COGL_DEBUG_ATLAS
  COGL_DEBUG_DUMP_ATLAS_IMAGE
  COGL_DEBUG_DISABLE_ATLAS
  COGL_DEBUG_DISABLE_SHARED_ATLAS
  COGL_DEBUG_OPENGL
  COGL_DEBUG_DISABLE_TEXTURING
  COGL_DEBUG_SHOW_SOURCE
  COGL_DEBUG_DISABLE_BLENDING
  COGL_DEBUG_TEXTURE_PIXMAP
  COGL_DEBUG_BITMAP
  COGL_DEBUG_WIREFRAME
  COGL_DEBUG_DISABLE_SOFTWARE_CLIP
  COGL_DEBUG_DISABLE_PROGRAM_CACHES
  COGL_DEBUG_DISABLE_FAST_READ_PIXEL
  COGL_DEBUG_CLIPPING
  COGL_DEBUG_WINSYS
  COGL_DEBUG_PERFORMANCE
  COGL_DEBUG_SYNC_PRIMITIVE
  COGL_DEBUG_SYNC_FRAME
  COGL_DEBUG_TEXTURES
  COGL_DEBUG_STENCILLING
  COGL_DEBUG_N_FLAGS
>;

constant MutterCoglDepthTestFunction is export := guint32;
our enum MutterCoglDepthTestFunctionEnum is export (
  COGL_DEPTH_TEST_FUNCTION_NEVER    => 0x0200,
  COGL_DEPTH_TEST_FUNCTION_LESS     => 0x0201,
  COGL_DEPTH_TEST_FUNCTION_EQUAL    => 0x0202,
  COGL_DEPTH_TEST_FUNCTION_LEQUAL   => 0x0203,
  COGL_DEPTH_TEST_FUNCTION_GREATER  => 0x0204,
  COGL_DEPTH_TEST_FUNCTION_NOTEQUAL => 0x0205,
  COGL_DEPTH_TEST_FUNCTION_GEQUAL   => 0x0206,
  COGL_DEPTH_TEST_FUNCTION_ALWAYS   => 0x0207,
);

constant MutterCoglDrawFlags is export := guint32;
our enum MutterCoglDrawFlagsEnum is export (
  COGL_DRAW_SKIP_JOURNAL_FLUSH        => 1 +< 0,
  COGL_DRAW_SKIP_PIPELINE_VALIDATION  => 1 +< 1,
  COGL_DRAW_SKIP_FRAMEBUFFER_FLUSH    => 1 +< 2,
  COGL_DRAW_COLOR_ATTRIBUTE_IS_OPAQUE => 1 +< 3,
  COGL_DRAW_SKIP_DEBUG_WIREFRAME      => 1 +< 4,
);

constant MutterCoglDriverError is export := guint32;
our enum MutterCoglDriverErrorEnum is export <
  COGL_DRIVER_ERROR_UNKNOWN_VERSION
  COGL_DRIVER_ERROR_INVALID_VERSION
  COGL_DRIVER_ERROR_NO_SUITABLE_DRIVER_FOUND
  COGL_DRIVER_ERROR_FAILED_TO_LOAD_LIBRARY
>;

constant MutterCoglEglImageFlags is export := guint32;
our enum MutterCoglEglImageFlagsEnum is export (
  COGL_EGL_IMAGE_FLAG_NONE        =>      0,
  COGL_EGL_IMAGE_FLAG_NO_GET_DATA => 1 +< 0,
);

constant MutterCoglFeatureID is export := guint32;
our enum MutterCoglFeatureIDEnum is export <
  COGL_FEATURE_ID_UNSIGNED_INT_INDICES
  COGL_FEATURE_ID_MAP_BUFFER_FOR_READ
  COGL_FEATURE_ID_MAP_BUFFER_FOR_WRITE
  COGL_FEATURE_ID_FENCE
  COGL_FEATURE_ID_TEXTURE_RG
  COGL_FEATURE_ID_BUFFER_AGE
  COGL_FEATURE_ID_TEXTURE_EGL_IMAGE_EXTERNAL
  COGL_FEATURE_ID_BLIT_FRAMEBUFFER
  COGL_FEATURE_ID_TIMESTAMP_QUERY
  _COGL_N_FEATURE_IDS
>;

constant MutterCoglFenceType is export := guint32;
our enum MutterCoglFenceTypeEnum is export <
  FENCE_TYPE_PENDING
  FENCE_TYPE_GL_ARB
  FENCE_TYPE_WINSYS
  FENCE_TYPE_ERROR
>;

constant MutterCoglFilterReturn is export := guint32;
our enum MutterCoglFilterReturnEnum is export <
  COGL_FILTER_CONTINUE
  COGL_FILTER_REMOVE
>;

constant MutterCoglFrameEvent is export := guint32;
our enum MutterCoglFrameEventEnum is export (
  COGL_FRAME_EVENT_SYNC     => 1,
  'COGL_FRAME_EVENT_COMPLETE'
);

constant MutterCoglFrameInfoFlag is export := guint32;
our enum MutterCoglFrameInfoFlagEnum is export (
  COGL_FRAME_INFO_FLAG_NONE      =>      0,
  COGL_FRAME_INFO_FLAG_SYMBOLIC  => 1 +< 0,
  COGL_FRAME_INFO_FLAG_HW_CLOCK  => 1 +< 1,
  COGL_FRAME_INFO_FLAG_ZERO_COPY => 1 +< 2,
  COGL_FRAME_INFO_FLAG_VSYNC     => 1 +< 3,
);

constant MutterCoglFramebufferDriverType is export := guint32;
our enum MutterCoglFramebufferDriverTypeEnum is export <
  COGL_FRAMEBUFFER_DRIVER_TYPE_FBO
  COGL_FRAMEBUFFER_DRIVER_TYPE_BACK
>;

constant MutterCoglFramebufferError is export := guint32;
our enum MutterCoglFramebufferErrorEnum is export <
  COGL_FRAMEBUFFER_ERROR_ALLOCATE
>;

constant MutterCoglFramebufferState is export := guint32;
our enum MutterCoglFramebufferStateEnum is export (
  COGL_FRAMEBUFFER_STATE_BIND               => 1+<0,
  COGL_FRAMEBUFFER_STATE_VIEWPORT           => 1+<1,
  COGL_FRAMEBUFFER_STATE_CLIP               => 1+<2,
  COGL_FRAMEBUFFER_STATE_DITHER             => 1+<3,
  COGL_FRAMEBUFFER_STATE_MODELVIEW          => 1+<4,
  COGL_FRAMEBUFFER_STATE_PROJECTION         => 1+<5,
  COGL_FRAMEBUFFER_STATE_FRONT_FACE_WINDING => 1+<6,
  COGL_FRAMEBUFFER_STATE_DEPTH_WRITE        => 1+<7,
  COGL_FRAMEBUFFER_STATE_STEREO_MODE        => 1+<8,
);

constant MutterCoglFramebufferStateIndex is export := guint32;
our enum MutterCoglFramebufferStateIndexEnum is export (
  COGL_FRAMEBUFFER_STATE_INDEX_BIND               => 0,
  COGL_FRAMEBUFFER_STATE_INDEX_VIEWPORT           => 1,
  COGL_FRAMEBUFFER_STATE_INDEX_CLIP               => 2,
  COGL_FRAMEBUFFER_STATE_INDEX_DITHER             => 3,
  COGL_FRAMEBUFFER_STATE_INDEX_MODELVIEW          => 4,
  COGL_FRAMEBUFFER_STATE_INDEX_PROJECTION         => 5,
  COGL_FRAMEBUFFER_STATE_INDEX_FRONT_FACE_WINDING => 6,
  COGL_FRAMEBUFFER_STATE_INDEX_DEPTH_WRITE        => 7,
  COGL_FRAMEBUFFER_STATE_INDEX_STEREO_MODE        => 8,
  COGL_FRAMEBUFFER_STATE_INDEX_MAX                => 9,
);

constant MutterCoglGraphicsResetStatus is export := guint32;
our enum MutterCoglGraphicsResetStatusEnum is export <
  COGL_GRAPHICS_RESET_STATUS_NO_ERROR
  COGL_GRAPHICS_RESET_STATUS_GUILTY_CONTEXT_RESET
  COGL_GRAPHICS_RESET_STATUS_INNOCENT_CONTEXT_RESET
  COGL_GRAPHICS_RESET_STATUS_UNKNOWN_CONTEXT_RESET
  COGL_GRAPHICS_RESET_STATUS_PURGED_CONTEXT_RESET
>;

constant MutterCoglIndicesType is export := guint32;
our enum MutterCoglIndicesTypeEnum is export <
  COGL_INDICES_TYPE_UNSIGNED_BYTE
  COGL_INDICES_TYPE_UNSIGNED_SHORT
  COGL_INDICES_TYPE_UNSIGNED_INT
>;

constant MutterCoglMatrixOp is export := guint32;
our enum MutterCoglMatrixOpEnum is export <
  COGL_MATRIX_OP_LOAD_IDENTITY
  COGL_MATRIX_OP_TRANSLATE
  COGL_MATRIX_OP_ROTATE
  COGL_MATRIX_OP_ROTATE_EULER
  COGL_MATRIX_OP_SCALE
  COGL_MATRIX_OP_MULTIPLY
  COGL_MATRIX_OP_LOAD
  COGL_MATRIX_OP_SAVE
>;

constant MutterCoglOffscreenAllocateFlags is export := guint32;
our enum MutterCoglOffscreenAllocateFlagsEnum is export (
  COGL_OFFSCREEN_ALLOCATE_FLAG_DEPTH_STENCIL => 1 +< 0,
  COGL_OFFSCREEN_ALLOCATE_FLAG_DEPTH         => 1 +< 1,
  COGL_OFFSCREEN_ALLOCATE_FLAG_STENCIL       => 1 +< 2,
);

constant MutterCoglOffscreenFlags is export := guint32;
our enum MutterCoglOffscreenFlagsEnum is export (
  COGL_OFFSCREEN_DISABLE_DEPTH_AND_STENCIL => 1,
);

constant MutterCoglPipelineAlphaFunc is export := guint32;
our enum MutterCoglPipelineAlphaFuncEnum is export (
  COGL_PIPELINE_ALPHA_FUNC_NEVER    => 0x0200,
  COGL_PIPELINE_ALPHA_FUNC_LESS     => 0x0201,
  COGL_PIPELINE_ALPHA_FUNC_EQUAL    => 0x0202,
  COGL_PIPELINE_ALPHA_FUNC_LEQUAL   => 0x0203,
  COGL_PIPELINE_ALPHA_FUNC_GREATER  => 0x0204,
  COGL_PIPELINE_ALPHA_FUNC_NOTEQUAL => 0x0205,
  COGL_PIPELINE_ALPHA_FUNC_GEQUAL   => 0x0206,
  COGL_PIPELINE_ALPHA_FUNC_ALWAYS   => 0x0207,
);

constant MutterCoglPipelineCombineOp is export := guint32;
our enum MutterCoglPipelineCombineOpEnum is export (
  COGL_PIPELINE_COMBINE_OP_SRC_COLOR           => 0x0300,
  COGL_PIPELINE_COMBINE_OP_ONE_MINUS_SRC_COLOR => 0x0301,
  COGL_PIPELINE_COMBINE_OP_SRC_ALPHA           => 0x0302,
  COGL_PIPELINE_COMBINE_OP_ONE_MINUS_SRC_ALPHA => 0x0303,
);

constant MutterCoglPipelineCullFaceMode is export := guint32;
our enum MutterCoglPipelineCullFaceModeEnum is export <
  COGL_PIPELINE_CULL_FACE_MODE_NONE
  COGL_PIPELINE_CULL_FACE_MODE_FRONT
  COGL_PIPELINE_CULL_FACE_MODE_BACK
  COGL_PIPELINE_CULL_FACE_MODE_BOTH
>;

constant MutterCoglPipelineEvalFlags is export := guint32;
our enum MutterCoglPipelineEvalFlagsEnum is export (
  COGL_PIPELINE_EVAL_FLAG_NONE => 0,
);

constant MutterCoglPipelineFilter is export := guint32;
our enum MutterCoglPipelineFilterEnum is export (
  COGL_PIPELINE_FILTER_NEAREST                => 0x2600,
  COGL_PIPELINE_FILTER_LINEAR                 => 0x2601,
  COGL_PIPELINE_FILTER_NEAREST_MIPMAP_NEAREST => 0x2700,
  COGL_PIPELINE_FILTER_LINEAR_MIPMAP_NEAREST  => 0x2701,
  COGL_PIPELINE_FILTER_NEAREST_MIPMAP_LINEAR  => 0x2702,
  COGL_PIPELINE_FILTER_LINEAR_MIPMAP_LINEAR   => 0x2703,
);

constant MutterCoglPipelineGetLayerFlags is export := guint32;
our enum MutterCoglPipelineGetLayerFlagsEnum is export (
  COGL_PIPELINE_GET_LAYER_NO_CREATE => 1+<0,
);

constant MutterCoglPipelineLayerStateIndex is export := guint32;
our enum MutterCoglPipelineLayerStateIndexEnum is export (
  'COGL_PIPELINE_LAYER_STATE_UNIT_INDEX',
  'COGL_PIPELINE_LAYER_STATE_TEXTURE_DATA_INDEX',
  'COGL_PIPELINE_LAYER_STATE_SAMPLER_INDEX',
  'COGL_PIPELINE_LAYER_STATE_COMBINE_INDEX',
  'COGL_PIPELINE_LAYER_STATE_COMBINE_CONSTANT_INDEX',
  'COGL_PIPELINE_LAYER_STATE_USER_MATRIX_INDEX',
  'COGL_PIPELINE_LAYER_STATE_POINT_SPRITE_COORDS_INDEX',
  'COGL_PIPELINE_LAYER_STATE_VERTEX_SNIPPETS_INDEX',
  'COGL_PIPELINE_LAYER_STATE_FRAGMENT_SNIPPETS_INDEX',
  'COGL_PIPELINE_LAYER_STATE_SPARSE_COUNT',
  COGL_PIPELINE_LAYER_STATE_COUNT                     => 9,
);

constant MutterCoglPipelineLayerState is export := guint32;
our enum MutterCoglPipelineLayerStateEnum is export (
  COGL_PIPELINE_LAYER_STATE_UNIT                => 1 +< COGL_PIPELINE_LAYER_STATE_UNIT_INDEX,
  COGL_PIPELINE_LAYER_STATE_TEXTURE_DATA        => 1 +< COGL_PIPELINE_LAYER_STATE_TEXTURE_DATA_INDEX,
  COGL_PIPELINE_LAYER_STATE_SAMPLER             => 1 +< COGL_PIPELINE_LAYER_STATE_SAMPLER_INDEX,
  COGL_PIPELINE_LAYER_STATE_COMBINE             => 1 +< COGL_PIPELINE_LAYER_STATE_COMBINE_INDEX,
  COGL_PIPELINE_LAYER_STATE_COMBINE_CONSTANT    => 1 +< COGL_PIPELINE_LAYER_STATE_COMBINE_CONSTANT_INDEX,
  COGL_PIPELINE_LAYER_STATE_USER_MATRIX         => 1 +< COGL_PIPELINE_LAYER_STATE_USER_MATRIX_INDEX,
  COGL_PIPELINE_LAYER_STATE_POINT_SPRITE_COORDS => 1 +< COGL_PIPELINE_LAYER_STATE_POINT_SPRITE_COORDS_INDEX,
  COGL_PIPELINE_LAYER_STATE_VERTEX_SNIPPETS     => 1 +< COGL_PIPELINE_LAYER_STATE_VERTEX_SNIPPETS_INDEX,
  COGL_PIPELINE_LAYER_STATE_FRAGMENT_SNIPPETS   => 1 +< COGL_PIPELINE_LAYER_STATE_FRAGMENT_SNIPPETS_INDEX,
);

constant MutterCoglPipelineLayerType is export := guint32;
our enum MutterCoglPipelineLayerTypeEnum is export <
  COGL_PIPELINE_LAYER_TYPE_TEXTURE
>;

constant MutterCoglPipelineStateIndex is export := guint32;
our enum MutterCoglPipelineStateIndexEnum is export <
  COGL_PIPELINE_STATE_COLOR_INDEX
  COGL_PIPELINE_STATE_LAYERS_INDEX
  COGL_PIPELINE_STATE_ALPHA_FUNC_INDEX
  COGL_PIPELINE_STATE_ALPHA_FUNC_REFERENCE_INDEX
  COGL_PIPELINE_STATE_BLEND_INDEX
  COGL_PIPELINE_STATE_USER_SHADER_INDEX
  COGL_PIPELINE_STATE_DEPTH_INDEX
  COGL_PIPELINE_STATE_NON_ZERO_POINT_SIZE_INDEX
  COGL_PIPELINE_STATE_POINT_SIZE_INDEX
  COGL_PIPELINE_STATE_PER_VERTEX_POINT_SIZE_INDEX
  COGL_PIPELINE_STATE_CULL_FACE_INDEX
  COGL_PIPELINE_STATE_UNIFORMS_INDEX
  COGL_PIPELINE_STATE_VERTEX_SNIPPETS_INDEX
  COGL_PIPELINE_STATE_FRAGMENT_SNIPPETS_INDEX
  COGL_PIPELINE_STATE_REAL_BLEND_ENABLE_INDEX
  COGL_PIPELINE_STATE_COUNT
>;

constant MutterCoglPipelineState is export := guint32;
our enum MutterCoglPipelineStateEnum is export (
  COGL_PIPELINE_STATE_COLOR                 => 1 +< COGL_PIPELINE_STATE_COLOR_INDEX,
  COGL_PIPELINE_STATE_LAYERS                => 1 +< COGL_PIPELINE_STATE_LAYERS_INDEX,
  COGL_PIPELINE_STATE_ALPHA_FUNC            => 1 +< COGL_PIPELINE_STATE_ALPHA_FUNC_INDEX,
  COGL_PIPELINE_STATE_ALPHA_FUNC_REFERENCE  => 1 +< COGL_PIPELINE_STATE_ALPHA_FUNC_REFERENCE_INDEX,
  COGL_PIPELINE_STATE_BLEND                 => 1 +< COGL_PIPELINE_STATE_BLEND_INDEX,
  COGL_PIPELINE_STATE_USER_SHADER           => 1 +< COGL_PIPELINE_STATE_USER_SHADER_INDEX,
  COGL_PIPELINE_STATE_DEPTH                 => 1 +< COGL_PIPELINE_STATE_DEPTH_INDEX,
  COGL_PIPELINE_STATE_NON_ZERO_POINT_SIZE   => 1 +< COGL_PIPELINE_STATE_NON_ZERO_POINT_SIZE_INDEX,
  COGL_PIPELINE_STATE_POINT_SIZE            => 1 +< COGL_PIPELINE_STATE_POINT_SIZE_INDEX,
  COGL_PIPELINE_STATE_PER_VERTEX_POINT_SIZE => 1 +< COGL_PIPELINE_STATE_PER_VERTEX_POINT_SIZE_INDEX,
  COGL_PIPELINE_STATE_CULL_FACE             => 1 +< COGL_PIPELINE_STATE_CULL_FACE_INDEX,
  COGL_PIPELINE_STATE_UNIFORMS              => 1 +< COGL_PIPELINE_STATE_UNIFORMS_INDEX,
  COGL_PIPELINE_STATE_VERTEX_SNIPPETS       => 1 +< COGL_PIPELINE_STATE_VERTEX_SNIPPETS_INDEX,
  COGL_PIPELINE_STATE_FRAGMENT_SNIPPETS     => 1 +< COGL_PIPELINE_STATE_FRAGMENT_SNIPPETS_INDEX,
  COGL_PIPELINE_STATE_REAL_BLEND_ENABLE     => 1 +< COGL_PIPELINE_STATE_REAL_BLEND_ENABLE_INDEX,
);

our enum MutterCoglBits is export (
  COGL_A_BIT        => 1 +< 4,
  COGL_BGR_BIT      => 1 +< 5,
  COGL_AFIRST_BIT   => 1 +< 6,
  COGL_PREMULT_BIT  => 1 +< 7,
  COGL_DEPTH_BIT    => 1 +< 8,
  COGL_STENCIL_BIT  => 1 +< 9
);

constant MutterCoglPixelFormat is export := uint32;
our enum MutterCoglPixelFormatEnum is export (
 COGL_PIXEL_FORMAT_ANY                  => 0,
 COGL_PIXEL_FORMAT_A_8                  => 1 +| COGL_A_BIT,

 COGL_PIXEL_FORMAT_RGB_565              => 4,
 COGL_PIXEL_FORMAT_RGBA_4444            => 5 +| COGL_A_BIT,
 COGL_PIXEL_FORMAT_RGBA_5551            => 6 +| COGL_A_BIT,
 COGL_PIXEL_FORMAT_YUV                  => 7,
 COGL_PIXEL_FORMAT_G_8                  => 8,

 COGL_PIXEL_FORMAT_RG_88                => 9,

 COGL_PIXEL_FORMAT_RGB_888              => 2,
 COGL_PIXEL_FORMAT_BGR_888              => (2 +| COGL_BGR_BIT),

 COGL_PIXEL_FORMAT_RGBA_8888            => (3 +| COGL_A_BIT),
 COGL_PIXEL_FORMAT_BGRA_8888            => (3 +| COGL_A_BIT +| COGL_BGR_BIT),
 COGL_PIXEL_FORMAT_ARGB_8888            => (3 +| COGL_A_BIT +| COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ABGR_8888            => (3 +| COGL_A_BIT +| COGL_BGR_BIT +| COGL_AFIRST_BIT),

 COGL_PIXEL_FORMAT_RGBA_1010102         => (13 +| COGL_A_BIT),
 COGL_PIXEL_FORMAT_BGRA_1010102         => (13 +| COGL_A_BIT +| COGL_BGR_BIT),
 COGL_PIXEL_FORMAT_XRGB_2101010         => (13 +|                               COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ARGB_2101010         => (13 +| COGL_A_BIT +|                 COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_XBGR_2101010         => (13 +|               COGL_BGR_BIT +| COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ABGR_2101010         => (13 +| COGL_A_BIT +| COGL_BGR_BIT +| COGL_AFIRST_BIT),

 COGL_PIXEL_FORMAT_RGBA_FP_16161616     => (11 +| COGL_A_BIT),
 COGL_PIXEL_FORMAT_BGRA_FP_16161616     => (11 +| COGL_A_BIT +| COGL_BGR_BIT),
 COGL_PIXEL_FORMAT_XRGB_FP_16161616     => (11 +|                               COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ARGB_FP_16161616     => (11 +| COGL_A_BIT +|                 COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_XBGR_FP_16161616     => (11 +|               COGL_BGR_BIT +| COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ABGR_FP_16161616     => (11 +| COGL_A_BIT +| COGL_BGR_BIT +| COGL_AFIRST_BIT),

 COGL_PIXEL_FORMAT_RGBA_8888_PRE        => (3  +| COGL_A_BIT +| COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_BGRA_8888_PRE        => (3  +| COGL_A_BIT +| COGL_PREMULT_BIT +| COGL_BGR_BIT),
 COGL_PIXEL_FORMAT_ARGB_8888_PRE        => (3  +| COGL_A_BIT +| COGL_PREMULT_BIT +| COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ABGR_8888_PRE        => (3  +| COGL_A_BIT +| COGL_PREMULT_BIT +| COGL_BGR_BIT +| COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_RGBA_4444_PRE        => (21 +| COGL_A_BIT +| COGL_PREMULT_BIT), # (COGL_PIXEL_FORMAT_RGBA_4444 | COGL_A_BIT | COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_RGBA_5551_PRE        => (22 +| COGL_A_BIT +| COGL_PREMULT_BIT), # (COGL_PIXEL_FORMAT_RGBA_5551 | COGL_A_BIT | COGL_PREMULT_BIT),

 COGL_PIXEL_FORMAT_RGBA_1010102_PRE     => 157, # (COGL_PIXEL_FORMAT_RGBA_1010102 | COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_BGRA_1010102_PRE     => 189, # (COGL_PIXEL_FORMAT_BGRA_1010102 | COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_ARGB_2101010_PRE     => 221, # (COGL_PIXEL_FORMAT_ARGB_2101010 | COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_ABGR_2101010_PRE     => 253, # (COGL_PIXEL_FORMAT_ABGR_2101010 | COGL_PREMULT_BIT),

 COGL_PIXEL_FORMAT_RGBA_FP_16161616_PRE => (11 +| COGL_A_BIT +| COGL_PREMULT_BIT),
 COGL_PIXEL_FORMAT_BGRA_FP_16161616_PRE => (11 +| COGL_A_BIT +| COGL_PREMULT_BIT +| COGL_BGR_BIT),
 COGL_PIXEL_FORMAT_ARGB_FP_16161616_PRE => (11 +| COGL_A_BIT +| COGL_PREMULT_BIT +|                 COGL_AFIRST_BIT),
 COGL_PIXEL_FORMAT_ABGR_FP_16161616_PRE => (11 +| COGL_A_BIT +| COGL_PREMULT_BIT +| COGL_BGR_BIT +| COGL_AFIRST_BIT),

 COGL_PIXEL_FORMAT_DEPTH_16             => (9 +| COGL_DEPTH_BIT),
 COGL_PIXEL_FORMAT_DEPTH_32             => (3 +| COGL_DEPTH_BIT),

 COGL_PIXEL_FORMAT_DEPTH_24_STENCIL_8   => (3 +| COGL_DEPTH_BIT +| COGL_STENCIL_BIT)
);


# constant MutterCoglPollFDEvent is export := guint32;
# our enum MutterCoglPollFDEventEnum is export (
#   COGL_POLL_FD_EVENT_IN   => COGL_SYSDEF_POLLIN,
#   COGL_POLL_FD_EVENT_PRI  => COGL_SYSDEF_POLLPRI,
#   COGL_POLL_FD_EVENT_OUT  => COGL_SYSDEF_POLLOUT,
#   COGL_POLL_FD_EVENT_ERR  => COGL_SYSDEF_POLLERR,
#   COGL_POLL_FD_EVENT_HUP  => COGL_SYSDEF_POLLHUP,
#   COGL_POLL_FD_EVENT_NVAL => COGL_SYSDEF_POLLNVAL,
# );

constant MutterCoglPrivateReadPixelsFlags is export := guint64;
our enum MutterCoglPrivateReadPixelsFlagsEnum is export (
  COGL_READ_PIXELS_NO_FLIP => 1  +< 30,
);

constant MutterCoglReadPixelsFlags is export := guint64;
our enum MutterCoglReadPixelsFlagsEnum is export (
  COGL_READ_PIXELS_COLOR_BUFFER => 1  +< 0,
);

constant MutterCoglRendererError is export := guint32;
our enum MutterCoglRendererErrorEnum is export <
  COGL_RENDERER_ERROR_XLIB_DISPLAY_OPEN
  COGL_RENDERER_ERROR_BAD_CONSTRAINT
>;

# constant MutterCoglSamplerCacheWrapMode is export := guint32;
# our enum MutterCoglSamplerCacheWrapModeEnum is export (
#   COGL_SAMPLER_CACHE_WRAP_MODE_REPEAT          =>          GL_REPEAT,
#   COGL_SAMPLER_CACHE_WRAP_MODE_MIRRORED_REPEAT => GL_MIRRORED_REPEAT,
#   COGL_SAMPLER_CACHE_WRAP_MODE_CLAMP_TO_EDGE   =>   GL_CLAMP_TO_EDGE,
#   COGL_SAMPLER_CACHE_WRAP_MODE_CLAMP_TO_BORDER => GL_CLAMP_TO_BORDER,
#   COGL_SAMPLER_CACHE_WRAP_MODE_AUTOMATIC       =>          GL_ALWAYS,
# );

constant MutterCoglScanoutError is export := guint32;
our enum MutterCoglScanoutErrorEnum is export <
  COGL_SCANOUT_ERROR_INHIBITED
>;

constant MutterCoglShaderType is export := guint32;
our enum MutterCoglShaderTypeEnum is export <
  COGL_SHADER_TYPE_VERTEX
  COGL_SHADER_TYPE_FRAGMENT
>;

constant MutterCoglSnippetHook is export := guint32;
our enum MutterCoglSnippetHookEnum is export (
  COGL_SNIPPET_HOOK_VERTEX                  =>    0,
  'COGL_SNIPPET_HOOK_VERTEX_TRANSFORM',
  'COGL_SNIPPET_HOOK_VERTEX_GLOBALS',
  'COGL_SNIPPET_HOOK_POINT_SIZE',
  COGL_SNIPPET_HOOK_FRAGMENT                => 2048,
  'COGL_SNIPPET_HOOK_FRAGMENT_GLOBALS',
  COGL_SNIPPET_HOOK_TEXTURE_COORD_TRANSFORM => 4096,
  COGL_SNIPPET_HOOK_LAYER_FRAGMENT          => 6144,
  'COGL_SNIPPET_HOOK_TEXTURE_LOOKUP'
);

constant MutterCoglStereoMode is export := guint32;
our enum MutterCoglStereoModeEnum is export <
  COGL_STEREO_BOTH
  COGL_STEREO_LEFT
  COGL_STEREO_RIGHT
>;

constant MutterCoglSubpixelOrder is export := guint32;
our enum MutterCoglSubpixelOrderEnum is export <
  COGL_SUBPIXEL_ORDER_UNKNOWN
  COGL_SUBPIXEL_ORDER_NONE
  COGL_SUBPIXEL_ORDER_HORIZONTAL_RGB
  COGL_SUBPIXEL_ORDER_HORIZONTAL_BGR
  COGL_SUBPIXEL_ORDER_VERTICAL_RGB
  COGL_SUBPIXEL_ORDER_VERTICAL_BGR
>;

constant MutterCoglSystemError is export := guint32;
our enum MutterCoglSystemErrorEnum is export <
  COGL_SYSTEM_ERROR_UNSUPPORTED
  COGL_SYSTEM_ERROR_NO_MEMORY
>;

constant MutterCoglTextureChangeFlags is export := guint32;
our enum MutterCoglTextureChangeFlagsEnum is export <
  COGL_TEXTURE_CHANGE_GL_TEXTURES
>;

constant MutterCoglTextureComponents is export := guint32;
our enum MutterCoglTextureComponentsEnum is export (
  COGL_TEXTURE_COMPONENTS_A     => 1,
  'COGL_TEXTURE_COMPONENTS_RG',
  'COGL_TEXTURE_COMPONENTS_RGB',
  'COGL_TEXTURE_COMPONENTS_RGBA',
  'COGL_TEXTURE_COMPONENTS_DEPTH'
);

constant MutterCoglTextureError is export := guint32;
our enum MutterCoglTextureErrorEnum is export <
  COGL_TEXTURE_ERROR_SIZE
  COGL_TEXTURE_ERROR_FORMAT
  COGL_TEXTURE_ERROR_BAD_PARAMETER
  COGL_TEXTURE_ERROR_TYPE
>;

constant MutterCoglTextureFlags is export := guint32;
our enum MutterCoglTextureFlagsEnum is export (
  COGL_TEXTURE_NONE           =>      0,
  COGL_TEXTURE_NO_AUTO_MIPMAP => 1 +< 0,
  COGL_TEXTURE_NO_SLICING     => 1 +< 1,
  COGL_TEXTURE_NO_ATLAS       => 1 +< 2,
);

constant MutterCoglTexturePixmapStereoMode is export := guint32;
our enum MutterCoglTexturePixmapStereoModeEnum is export <
  COGL_TEXTURE_PIXMAP_MONO
  COGL_TEXTURE_PIXMAP_LEFT
  COGL_TEXTURE_PIXMAP_RIGHT
>;

constant MutterCoglTexturePrePaintFlags is export := guint32;
our enum MutterCoglTexturePrePaintFlagsEnum is export (
  COGL_TEXTURE_NEEDS_MIPMAP => 1,
);

constant MutterCoglTextureSourceType is export := guint32;
our enum MutterCoglTextureSourceTypeEnum is export (
  COGL_TEXTURE_SOURCE_TYPE_SIZED              => 1,
  'COGL_TEXTURE_SOURCE_TYPE_BITMAP',
  'COGL_TEXTURE_SOURCE_TYPE_EGL_IMAGE',
  'COGL_TEXTURE_SOURCE_TYPE_EGL_IMAGE_EXTERNAL'
);

constant MutterCoglTransformResult is export := guint32;
our enum MutterCoglTransformResultEnum is export <
  COGL_TRANSFORM_NO_REPEAT
  COGL_TRANSFORM_HARDWARE_REPEAT
  COGL_TRANSFORM_SOFTWARE_REPEAT
>;

constant MutterCoglVerticesMode is export := guint32;
our enum MutterCoglVerticesModeEnum is export (
  COGL_VERTICES_MODE_POINTS         => 0x0000,
  COGL_VERTICES_MODE_LINES          => 0x0001,
  COGL_VERTICES_MODE_LINE_LOOP      => 0x0002,
  COGL_VERTICES_MODE_LINE_STRIP     => 0x0003,
  COGL_VERTICES_MODE_TRIANGLES      => 0x0004,
  COGL_VERTICES_MODE_TRIANGLE_STRIP => 0x0005,
  COGL_VERTICES_MODE_TRIANGLE_FAN   => 0x0006,
);

constant MutterCoglWinding is export := guint32;
our enum MutterCoglWindingEnum is export <
  COGL_WINDING_CLOCKWISE
  COGL_WINDING_COUNTER_CLOCKWISE
>;

constant MutterCoglWinsysError is export := guint32;
our enum MutterCoglWinsysErrorEnum is export <
  COGL_WINSYS_ERROR_INIT
  COGL_WINSYS_ERROR_CREATE_CONTEXT
  COGL_WINSYS_ERROR_CREATE_ONSCREEN
  COGL_WINSYS_ERROR_MAKE_CURRENT
>;

constant MutterCoglWinsysFeature is export := guint32;
our enum MutterCoglWinsysFeatureEnum is export <
  COGL_WINSYS_FEATURE_VBLANK_COUNTER
  COGL_WINSYS_FEATURE_VBLANK_WAIT
  COGL_WINSYS_FEATURE_TEXTURE_FROM_PIXMAP
  COGL_WINSYS_FEATURE_SWAP_BUFFERS_EVENT
  COGL_WINSYS_FEATURE_SWAP_REGION
  COGL_WINSYS_FEATURE_SWAP_REGION_THROTTLE
  COGL_WINSYS_FEATURE_SWAP_REGION_SYNCHRONIZED
  COGL_WINSYS_FEATURE_BUFFER_AGE
  COGL_WINSYS_FEATURE_SYNC_AND_COMPLETE_EVENT
  COGL_WINSYS_FEATURE_N_FEATURES
>;

constant MutterCoglWinsysID is export := guint32;
our enum MutterCoglWinsysIDEnum is export <
  COGL_WINSYS_ID_ANY
  COGL_WINSYS_ID_STUB
  COGL_WINSYS_ID_GLX
  COGL_WINSYS_ID_EGL_XLIB
  COGL_WINSYS_ID_CUSTOM
>;

constant Features is export := guint32;
our enum FeaturesEnum is export <
  FEATURE_A
  FEATURE_B
  FEATURE_C
  N_FEATURES
>;

constant TestFlags is export := guint32;
our enum TestFlagsEnum is export (
  TEST_KNOWN_FAILURE                     =>  1+<0,
  TEST_REQUIREMENT_GL                    =>  1+<1,
  TEST_REQUIREMENT_NPOT                  =>  1+<2,
  TEST_REQUIREMENT_TEXTURE_RECTANGLE     =>  1+<4,
  TEST_REQUIREMENT_TEXTURE_RG            =>  1+<5,
  TEST_REQUIREMENT_POINT_SPRITE          =>  1+<6,
  TEST_REQUIREMENT_MAP_WRITE             =>  1+<8,
  TEST_REQUIREMENT_GLSL                  =>  1+<9,
  TEST_REQUIREMENT_OFFSCREEN             => 1+<10,
  TEST_REQUIREMENT_FENCE                 => 1+<11,
  TEST_REQUIREMENT_PER_VERTEX_POINT_SIZE => 1+<12,
);

constant TestUtilsTextureFlags is export := guint32;
our enum TestUtilsTextureFlagsEnum is export (
  TEST_UTILS_TEXTURE_NONE           =>      0,
  TEST_UTILS_TEXTURE_NO_AUTO_MIPMAP => 1 +< 0,
  TEST_UTILS_TEXTURE_NO_SLICING     => 1 +< 1,
  TEST_UTILS_TEXTURE_NO_ATLAS       => 1 +< 2,
);

constant MutterClutterPointerA11yFlags is export := guint32;
our enum MutterClutterPointerA11yFlagsEnum is export (
  CLUTTER_A11Y_SECONDARY_CLICK_ENABLED   => 1 +< 0,
  CLUTTER_A11Y_DWELL_ENABLED             => 1 +< 1,
);

constant MutterClutterPointerA11yDwellClickType is export := guint32;
our enum MutterClutterPointerA11yDwellClickTypeEnum is export <
  CLUTTER_A11Y_DWELL_CLICK_TYPE_NONE
  CLUTTER_A11Y_DWELL_CLICK_TYPE_PRIMARY
  CLUTTER_A11Y_DWELL_CLICK_TYPE_SECONDARY
  CLUTTER_A11Y_DWELL_CLICK_TYPE_MIDDLE
  CLUTTER_A11Y_DWELL_CLICK_TYPE_DOUBLE
  CLUTTER_A11Y_DWELL_CLICK_TYPE_DRAG
>;

constant MutterClutterPointerA11yDwellDirection is export := guint32;
our enum  MutterClutterPointerA11yDwellDirectionEnum is export <
  CLUTTER_A11Y_DWELL_DIRECTION_NONE
  CLUTTER_A11Y_DWELL_DIRECTION_LEFT
  CLUTTER_A11Y_DWELL_DIRECTION_RIGHT
  CLUTTER_A11Y_DWELL_DIRECTION_UP
  CLUTTER_A11Y_DWELL_DIRECTION_DOWN,
>;

constant MutterClutterPointerA11yDwellMode is export := guint32;
our enum MutterClutterPointerA11yDwellModeEnum is export <
  CLUTTER_A11Y_DWELL_MODE_WINDOW
  CLUTTER_A11Y_DWELL_MODE_GESTURE
>;

constant MutterClutterPointerA11yTimeoutType is export := guint32;
our enum MutterClutterPointerA11yTimeoutTypeEnum is export <
  CLUTTER_A11Y_TIMEOUT_TYPE_SECONDARY_CLICK
  CLUTTER_A11Y_TIMEOUT_TYPE_DWELL
  CLUTTER_A11Y_TIMEOUT_TYPE_GESTURE
>;

constant MutterClutterActorAlign is export := guint32;
our enum MutterClutterActorAlignEnum is export <
  CLUTTER_ACTOR_ALIGN_FILL
  CLUTTER_ACTOR_ALIGN_START
  CLUTTER_ACTOR_ALIGN_CENTER
  CLUTTER_ACTOR_ALIGN_END
>;

constant MutterClutterActorFlags is export := guint32;
our enum MutterClutterActorFlagsEnum is export (
  CLUTTER_ACTOR_MAPPED    => 1 +< 1,
  CLUTTER_ACTOR_REALIZED  => 1 +< 2,
  CLUTTER_ACTOR_REACTIVE  => 1 +< 3,
  CLUTTER_ACTOR_VISIBLE   => 1 +< 4,
  CLUTTER_ACTOR_NO_LAYOUT => 1 +< 5,
);

constant MutterClutterAlignAxis is export := guint32;
our enum MutterClutterAlignAxisEnum is export <
  CLUTTER_ALIGN_X_AXIS
  CLUTTER_ALIGN_Y_AXIS
  CLUTTER_ALIGN_BOTH
>;

constant MutterClutterAnimationMode is export := guint32;
our enum MutterClutterAnimationModeEnum is export (
  CLUTTER_CUSTOM_MODE         => 0,
  'CLUTTER_LINEAR',
  'CLUTTER_EASE_IN_QUAD',
  'CLUTTER_EASE_OUT_QUAD',
  'CLUTTER_EASE_IN_OUT_QUAD',
  'CLUTTER_EASE_IN_CUBIC',
  'CLUTTER_EASE_OUT_CUBIC',
  'CLUTTER_EASE_IN_OUT_CUBIC',
  'CLUTTER_EASE_IN_QUART',
  'CLUTTER_EASE_OUT_QUART',
  'CLUTTER_EASE_IN_OUT_QUART',
  'CLUTTER_EASE_IN_QUINT',
  'CLUTTER_EASE_OUT_QUINT',
  'CLUTTER_EASE_IN_OUT_QUINT',
  'CLUTTER_EASE_IN_SINE',
  'CLUTTER_EASE_OUT_SINE',
  'CLUTTER_EASE_IN_OUT_SINE',
  'CLUTTER_EASE_IN_EXPO',
  'CLUTTER_EASE_OUT_EXPO',
  'CLUTTER_EASE_IN_OUT_EXPO',
  'CLUTTER_EASE_IN_CIRC',
  'CLUTTER_EASE_OUT_CIRC',
  'CLUTTER_EASE_IN_OUT_CIRC',
  'CLUTTER_EASE_IN_ELASTIC',
  'CLUTTER_EASE_OUT_ELASTIC',
  'CLUTTER_EASE_IN_OUT_ELASTIC',
  'CLUTTER_EASE_IN_BACK',
  'CLUTTER_EASE_OUT_BACK',
  'CLUTTER_EASE_IN_OUT_BACK',
  'CLUTTER_EASE_IN_BOUNCE',
  'CLUTTER_EASE_OUT_BOUNCE',
  'CLUTTER_EASE_IN_OUT_BOUNCE',
  'CLUTTER_STEPS',
  'CLUTTER_STEP_START',
  'CLUTTER_STEP_END',
  'CLUTTER_CUBIC_BEZIER',
  'CLUTTER_EASE',
  'CLUTTER_EASE_IN',
  'CLUTTER_EASE_OUT',
  'CLUTTER_EASE_IN_OUT',
  'CLUTTER_ANIMATION_LAST'
);

constant MutterClutterBinAlignment is export := guint32;
our enum MutterClutterBinAlignmentEnum is export <
  CLUTTER_BIN_ALIGNMENT_FIXED
  CLUTTER_BIN_ALIGNMENT_FILL
  CLUTTER_BIN_ALIGNMENT_START
  CLUTTER_BIN_ALIGNMENT_END
  CLUTTER_BIN_ALIGNMENT_CENTER
>;

constant MutterClutterBindCoordinate is export := guint32;
our enum MutterClutterBindCoordinateEnum is export <
  CLUTTER_BIND_X
  CLUTTER_BIND_Y
  CLUTTER_BIND_WIDTH
  CLUTTER_BIND_HEIGHT
  CLUTTER_BIND_POSITION
  CLUTTER_BIND_SIZE
  CLUTTER_BIND_ALL
>;

constant MutterClutterBoxAlignment is export := guint32;
our enum MutterClutterBoxAlignmentEnum is export <
  CLUTTER_BOX_ALIGNMENT_START
  CLUTTER_BOX_ALIGNMENT_END
  CLUTTER_BOX_ALIGNMENT_CENTER
>;

constant MutterClutterButtonState is export := guint32;
our enum MutterClutterButtonStateEnum is export <
  CLUTTER_BUTTON_STATE_RELEASED
  CLUTTER_BUTTON_STATE_PRESSED
>;

constant MutterClutterContentGravity is export := guint32;
our enum MutterClutterContentGravityEnum is export <
  CLUTTER_CONTENT_GRAVITY_TOP_LEFT
  CLUTTER_CONTENT_GRAVITY_TOP
  CLUTTER_CONTENT_GRAVITY_TOP_RIGHT
  CLUTTER_CONTENT_GRAVITY_LEFT
  CLUTTER_CONTENT_GRAVITY_CENTER
  CLUTTER_CONTENT_GRAVITY_RIGHT
  CLUTTER_CONTENT_GRAVITY_BOTTOM_LEFT
  CLUTTER_CONTENT_GRAVITY_BOTTOM
  CLUTTER_CONTENT_GRAVITY_BOTTOM_RIGHT
  CLUTTER_CONTENT_GRAVITY_RESIZE_FILL
  CLUTTER_CONTENT_GRAVITY_RESIZE_ASPECT
>;

constant MutterClutterContentRepeat is export := guint32;
our enum MutterClutterContentRepeatEnum is export (
  CLUTTER_REPEAT_NONE   => 0,
  CLUTTER_REPEAT_X_AXIS => 1 +< 0,
  CLUTTER_REPEAT_Y_AXIS => 1 +< 1,
  CLUTTER_REPEAT_BOTH   => 1 +< 0 +| 1 +< 1
);

constant MutterClutterDebugFlag is export := guint32;
our enum MutterClutterDebugFlagEnum is export (
  CLUTTER_DEBUG_MISC           =>  1 +< 0,
  CLUTTER_DEBUG_ACTOR          =>  1 +< 1,
  CLUTTER_DEBUG_TEXTURE        =>  1 +< 2,
  CLUTTER_DEBUG_EVENT          =>  1 +< 3,
  CLUTTER_DEBUG_PAINT          =>  1 +< 4,
  CLUTTER_DEBUG_PANGO          =>  1 +< 5,
  CLUTTER_DEBUG_BACKEND        =>  1 +< 6,
  CLUTTER_DEBUG_SCHEDULER      =>  1 +< 7,
  CLUTTER_DEBUG_SCRIPT         =>  1 +< 8,
  CLUTTER_DEBUG_SHADER         =>  1 +< 9,
  CLUTTER_DEBUG_MULTISTAGE     => 1 +< 10,
  CLUTTER_DEBUG_ANIMATION      => 1 +< 11,
  CLUTTER_DEBUG_LAYOUT         => 1 +< 12,
  CLUTTER_DEBUG_PICK           => 1 +< 13,
  CLUTTER_DEBUG_EVENTLOOP      => 1 +< 14,
  CLUTTER_DEBUG_CLIPPING       => 1 +< 15,
  CLUTTER_DEBUG_OOB_TRANSFORMS => 1 +< 16,
  CLUTTER_DEBUG_FRAME_TIMINGS  => 1 +< 17,
  CLUTTER_DEBUG_DETAILED_TRACE => 1 +< 18,
);

constant MutterClutterDragAxis is export := guint32;
our enum MutterClutterDragAxisEnum is export (
  CLUTTER_DRAG_AXIS_NONE => 0,
  'CLUTTER_DRAG_X_AXIS',
  'CLUTTER_DRAG_Y_AXIS'
);

constant MutterClutterDrawDebugFlag is export := guint32;
our enum MutterClutterDrawDebugFlagEnum is export (
  CLUTTER_DEBUG_DISABLE_SWAP_EVENTS             =>  1 +< 0,
  CLUTTER_DEBUG_DISABLE_CLIPPED_REDRAWS         =>  1 +< 1,
  CLUTTER_DEBUG_REDRAWS                         =>  1 +< 2,
  CLUTTER_DEBUG_PAINT_VOLUMES                   =>  1 +< 3,
  CLUTTER_DEBUG_DISABLE_CULLING                 =>  1 +< 4,
  CLUTTER_DEBUG_DISABLE_OFFSCREEN_REDIRECT      =>  1 +< 5,
  CLUTTER_DEBUG_CONTINUOUS_REDRAW               =>  1 +< 6,
  CLUTTER_DEBUG_PAINT_DEFORM_TILES              =>  1 +< 7,
  CLUTTER_DEBUG_PAINT_DAMAGE_REGION             =>  1 +< 8,
  CLUTTER_DEBUG_DISABLE_DYNAMIC_MAX_RENDER_TIME =>  1 +< 9,
  CLUTTER_DEBUG_PAINT_MAX_RENDER_TIME           => 1 +< 10,
);

constant MutterClutterEffectPaintFlags is export := guint32;
our enum MutterClutterEffectPaintFlagsEnum is export (
  CLUTTER_EFFECT_PAINT_ACTOR_DIRTY   => (1 +< 0),
  CLUTTER_EFFECT_PAINT_BYPASS_EFFECT => (1 +< 1),
);

constant MutterClutterEventFlags is export := guint32;
our enum MutterClutterEventFlagsEnum is export (
  CLUTTER_EVENT_NONE                 =>      0,
  CLUTTER_EVENT_FLAG_SYNTHETIC       => 1 +< 0,
  CLUTTER_EVENT_FLAG_INPUT_METHOD    => 1 +< 1,
  CLUTTER_EVENT_FLAG_REPEATED        => 1 +< 2,
  CLUTTER_EVENT_FLAG_RELATIVE_MOTION => 1 +< 3,
  CLUTTER_EVENT_FLAG_GRAB_NOTIFY     => 1 +< 4,
);

constant MutterClutterEventPhase is export := guint32;
our enum MutterClutterEventPhaseEnum is export <
  CLUTTER_PHASE_CAPTURE
  CLUTTER_PHASE_BUBBLE
>;

constant MutterClutterEventType is export := guint32;
our enum MutterClutterEventTypeEnum is export (
  CLUTTER_NOTHING            => 0,
  'CLUTTER_KEY_PRESS',
  'CLUTTER_KEY_RELEASE',
  'CLUTTER_MOTION',
  'CLUTTER_ENTER',
  'CLUTTER_LEAVE',
  'CLUTTER_BUTTON_PRESS',
  'CLUTTER_BUTTON_RELEASE',
  'CLUTTER_SCROLL',
  'CLUTTER_TOUCH_BEGIN',
  'CLUTTER_TOUCH_UPDATE',
  'CLUTTER_TOUCH_END',
  'CLUTTER_TOUCH_CANCEL',
  'CLUTTER_TOUCHPAD_PINCH',
  'CLUTTER_TOUCHPAD_SWIPE',
  'CLUTTER_TOUCHPAD_HOLD',
  'CLUTTER_PROXIMITY_IN',
  'CLUTTER_PROXIMITY_OUT',
  'CLUTTER_PAD_BUTTON_PRESS',
  'CLUTTER_PAD_BUTTON_RELEASE',
  'CLUTTER_PAD_STRIP',
  'CLUTTER_PAD_RING',
  'CLUTTER_DEVICE_ADDED',
  'CLUTTER_DEVICE_REMOVED',
  'CLUTTER_IM_COMMIT',
  'CLUTTER_IM_DELETE',
  'CLUTTER_IM_PREEDIT',
  'CLUTTER_EVENT_LAST'
);

constant MutterClutterFeatureFlags is export := guint32;
our enum MutterClutterFeatureFlagsEnum is export (
  CLUTTER_FEATURE_SHADERS_GLSL => (1 +< 9),
);

constant MutterClutterFlowOrientation is export := guint32;
our enum MutterClutterFlowOrientationEnum is export <
  CLUTTER_FLOW_HORIZONTAL
  CLUTTER_FLOW_VERTICAL
>;

constant MutterClutterFrameHint is export := guint32;
our enum MutterClutterFrameHintEnum is export (
  CLUTTER_FRAME_HINT_NONE                     =>      0,
  CLUTTER_FRAME_HINT_DIRECT_SCANOUT_ATTEMPTED => 1 +< 0,
);

constant MutterClutterFrameInfoFlag is export := guint32;
our enum MutterClutterFrameInfoFlagEnum is export (
  CLUTTER_FRAME_INFO_FLAG_NONE      =>      0,
  CLUTTER_FRAME_INFO_FLAG_HW_CLOCK  => 1 +< 0,
  CLUTTER_FRAME_INFO_FLAG_ZERO_COPY => 1 +< 1,
  CLUTTER_FRAME_INFO_FLAG_VSYNC     => 1 +< 2,
);

constant MutterClutterFrameResult is export := guint32;
our enum MutterClutterFrameResultEnum is export <
  CLUTTER_FRAME_RESULT_PENDING_PRESENTED
  CLUTTER_FRAME_RESULT_IDLE
>;

constant MutterClutterGestureTriggerEdge is export := guint32;
our enum MutterClutterGestureTriggerEdgeEnum is export (
  CLUTTER_GESTURE_TRIGGER_EDGE_NONE   => 0,
  'CLUTTER_GESTURE_TRIGGER_EDGE_AFTER',
  'CLUTTER_GESTURE_TRIGGER_EDGE_BEFORE'
);

constant MutterClutterGravity is export := guint32;
our enum MutterClutterGravityEnum is export (
  CLUTTER_GRAVITY_NONE       => 0,
  'CLUTTER_GRAVITY_NORTH',
  'CLUTTER_GRAVITY_NORTH_EAST',
  'CLUTTER_GRAVITY_EAST',
  'CLUTTER_GRAVITY_SOUTH_EAST',
  'CLUTTER_GRAVITY_SOUTH',
  'CLUTTER_GRAVITY_SOUTH_WEST',
  'CLUTTER_GRAVITY_WEST',
  'CLUTTER_GRAVITY_NORTH_WEST',
  'CLUTTER_GRAVITY_CENTER'
);

constant MutterClutterGridPosition is export := guint32;
our enum MutterClutterGridPositionEnum is export <
  CLUTTER_GRID_POSITION_LEFT
  CLUTTER_GRID_POSITION_RIGHT
  CLUTTER_GRID_POSITION_TOP
  CLUTTER_GRID_POSITION_BOTTOM
>;

constant MutterClutterGrabState is export := guint32;
our enum MutterClutterGrabStateEnum is export (
  CLUTTER_GRAB_STATE_NONE     => 0,
  CLUTTER_GRAB_STATE_POINTER  => 1,
  CLUTTER_GRAB_STATE_KEYBOARD => 1 +< 1,
  CLUTTER_GRAB_STATE_ALL      => 1 +| 1 +< 1 # (CLUTTER_GRAB_STATE_POINTER | CLUTTER_GRAB_STATE_KEYBOARD),
);

constant MutterClutterImageError is export := guint32;
our enum MutterClutterImageErrorEnum is export <
  CLUTTER_IMAGE_ERROR_INVALID_DATA
>;

constant MutterClutterInputAxis is export := guint32;
our enum MutterClutterInputAxisEnum is export <
  CLUTTER_INPUT_AXIS_IGNORE
  CLUTTER_INPUT_AXIS_X
  CLUTTER_INPUT_AXIS_Y
  CLUTTER_INPUT_AXIS_PRESSURE
  CLUTTER_INPUT_AXIS_XTILT
  CLUTTER_INPUT_AXIS_YTILT
  CLUTTER_INPUT_AXIS_WHEEL
  CLUTTER_INPUT_AXIS_DISTANCE
  CLUTTER_INPUT_AXIS_ROTATION
  CLUTTER_INPUT_AXIS_SLIDER
  CLUTTER_INPUT_AXIS_LAST
>;

constant MutterClutterInputAxisFlags is export := guint32;
our enum MutterClutterInputAxisFlagsEnum is export (
  CLUTTER_INPUT_AXIS_FLAG_NONE     => 0,
  CLUTTER_INPUT_AXIS_FLAG_X        => 1 +< CLUTTER_INPUT_AXIS_X,
  CLUTTER_INPUT_AXIS_FLAG_Y        => 1 +< CLUTTER_INPUT_AXIS_Y,
  CLUTTER_INPUT_AXIS_FLAG_PRESSURE => 1 +< CLUTTER_INPUT_AXIS_PRESSURE,
  CLUTTER_INPUT_AXIS_FLAG_XTILT    => 1 +< CLUTTER_INPUT_AXIS_XTILT,
  CLUTTER_INPUT_AXIS_FLAG_YTILT    => 1 +< CLUTTER_INPUT_AXIS_YTILT,
  CLUTTER_INPUT_AXIS_FLAG_WHEEL    => 1 +< CLUTTER_INPUT_AXIS_WHEEL,
  CLUTTER_INPUT_AXIS_FLAG_DISTANCE => 1 +< CLUTTER_INPUT_AXIS_DISTANCE,
  CLUTTER_INPUT_AXIS_FLAG_ROTATION => 1 +< CLUTTER_INPUT_AXIS_ROTATION,
  CLUTTER_INPUT_AXIS_FLAG_SLIDER   => 1 +< CLUTTER_INPUT_AXIS_SLIDER,
);

constant MutterClutterInputCapabilities is export := guint32;
our enum MutterClutterInputCapabilitiesEnum is export (
  CLUTTER_INPUT_CAPABILITY_NONE        =>      0,
  CLUTTER_INPUT_CAPABILITY_POINTER     => 1 +< 0,
  CLUTTER_INPUT_CAPABILITY_KEYBOARD    => 1 +< 1,
  CLUTTER_INPUT_CAPABILITY_TOUCHPAD    => 1 +< 2,
  CLUTTER_INPUT_CAPABILITY_TOUCH       => 1 +< 3,
  CLUTTER_INPUT_CAPABILITY_TABLET_TOOL => 1 +< 4,
  CLUTTER_INPUT_CAPABILITY_TABLET_PAD  => 1 +< 5,
);

constant MutterClutterInputContentHintFlags is export := guint32;
our enum MutterClutterInputContentHintFlagsEnum is export (
  CLUTTER_INPUT_CONTENT_HINT_COMPLETION          => 1 +< 0,
  CLUTTER_INPUT_CONTENT_HINT_SPELLCHECK          => 1 +< 1,
  CLUTTER_INPUT_CONTENT_HINT_AUTO_CAPITALIZATION => 1 +< 2,
  CLUTTER_INPUT_CONTENT_HINT_LOWERCASE           => 1 +< 3,
  CLUTTER_INPUT_CONTENT_HINT_UPPERCASE           => 1 +< 4,
  CLUTTER_INPUT_CONTENT_HINT_TITLECASE           => 1 +< 5,
  CLUTTER_INPUT_CONTENT_HINT_HIDDEN_TEXT         => 1 +< 6,
  CLUTTER_INPUT_CONTENT_HINT_SENSITIVE_DATA      => 1 +< 7,
  CLUTTER_INPUT_CONTENT_HINT_LATIN               => 1 +< 8,
  CLUTTER_INPUT_CONTENT_HINT_MULTILINE           => 1 +< 9,
);

constant MutterClutterInputContentPurpose is export := guint32;
our enum MutterClutterInputContentPurposeEnum is export <
  CLUTTER_INPUT_CONTENT_PURPOSE_NORMAL
  CLUTTER_INPUT_CONTENT_PURPOSE_ALPHA
  CLUTTER_INPUT_CONTENT_PURPOSE_DIGITS
  CLUTTER_INPUT_CONTENT_PURPOSE_NUMBER
  CLUTTER_INPUT_CONTENT_PURPOSE_PHONE
  CLUTTER_INPUT_CONTENT_PURPOSE_URL
  CLUTTER_INPUT_CONTENT_PURPOSE_EMAIL
  CLUTTER_INPUT_CONTENT_PURPOSE_NAME
  CLUTTER_INPUT_CONTENT_PURPOSE_PASSWORD
  CLUTTER_INPUT_CONTENT_PURPOSE_DATE
  CLUTTER_INPUT_CONTENT_PURPOSE_TIME
  CLUTTER_INPUT_CONTENT_PURPOSE_DATETIME
  CLUTTER_INPUT_CONTENT_PURPOSE_TERMINAL
>;

constant MutterClutterInputDevicePadFeature is export := guint32;
our enum MutterClutterInputDevicePadFeatureEnum is export <
  CLUTTER_PAD_FEATURE_BUTTON
  CLUTTER_PAD_FEATURE_RING
  CLUTTER_PAD_FEATURE_STRIP
>;

constant MutterClutterInputDevicePadSource is export := guint32;
our enum MutterClutterInputDevicePadSourceEnum is export <
  CLUTTER_INPUT_DEVICE_PAD_SOURCE_UNKNOWN
  CLUTTER_INPUT_DEVICE_PAD_SOURCE_FINGER
>;

constant MutterClutterInputDeviceToolType is export := guint32;
our enum MutterClutterInputDeviceToolTypeEnum is export <
  CLUTTER_INPUT_DEVICE_TOOL_NONE
  CLUTTER_INPUT_DEVICE_TOOL_PEN
  CLUTTER_INPUT_DEVICE_TOOL_ERASER
  CLUTTER_INPUT_DEVICE_TOOL_BRUSH
  CLUTTER_INPUT_DEVICE_TOOL_PENCIL
  CLUTTER_INPUT_DEVICE_TOOL_AIRBRUSH
  CLUTTER_INPUT_DEVICE_TOOL_MOUSE
  CLUTTER_INPUT_DEVICE_TOOL_LENS
>;

constant MutterClutterInputDeviceType is export := guint32;
our enum MutterClutterInputDeviceTypeEnum is export <
  CLUTTER_POINTER_DEVICE
  CLUTTER_KEYBOARD_DEVICE
  CLUTTER_EXTENSION_DEVICE
  CLUTTER_JOYSTICK_DEVICE
  CLUTTER_TABLET_DEVICE
  CLUTTER_TOUCHPAD_DEVICE
  CLUTTER_TOUCHSCREEN_DEVICE
  CLUTTER_PEN_DEVICE
  CLUTTER_ERASER_DEVICE
  CLUTTER_CURSOR_DEVICE
  CLUTTER_PAD_DEVICE
  CLUTTER_N_DEVICE_TYPES
>;

constant MutterClutterInputMode is export := guint32;
our enum MutterClutterInputModeEnum is export <
  CLUTTER_INPUT_MODE_LOGICAL
  CLUTTER_INPUT_MODE_PHYSICAL
  CLUTTER_INPUT_MODE_FLOATING
>;

constant MutterClutterInputPanelState is export := guint32;
our enum MutterClutterInputPanelStateEnum is export <
  CLUTTER_INPUT_PANEL_STATE_OFF
  CLUTTER_INPUT_PANEL_STATE_ON
  CLUTTER_INPUT_PANEL_STATE_TOGGLE
>;

constant MutterClutterInterpolation is export := guint32;
our enum MutterClutterInterpolationEnum is export <
  CLUTTER_INTERPOLATION_LINEAR
  CLUTTER_INTERPOLATION_CUBIC
>;

constant MutterClutterKeyState is export := guint32;
our enum MutterClutterKeyStateEnum is export <
  CLUTTER_KEY_STATE_RELEASED
  CLUTTER_KEY_STATE_PRESSED
>;

constant MutterClutterLongPressState is export := guint32;
our enum MutterClutterLongPressStateEnum is export <
  CLUTTER_LONG_PRESS_QUERY
  CLUTTER_LONG_PRESS_ACTIVATE
  CLUTTER_LONG_PRESS_CANCEL
>;

constant MutterClutterModifierType is export := guint32;
our enum MutterClutterModifierTypeEnum is export (
  CLUTTER_SHIFT_MASK                 => 1 +< 0,
  CLUTTER_LOCK_MASK                  => 1 +< 1,
  CLUTTER_CONTROL_MASK               => 1 +< 2,
  CLUTTER_MOD1_MASK                  => 1 +< 3,
  CLUTTER_MOD2_MASK                  => 1 +< 4,
  CLUTTER_MOD3_MASK                  => 1 +< 5,
  CLUTTER_MOD4_MASK                  => 1 +< 6,
  CLUTTER_MOD5_MASK                  => 1 +< 7,
  CLUTTER_BUTTON1_MASK               => 1 +< 8,
  CLUTTER_BUTTON2_MASK               => 1 +< 9,
  CLUTTER_BUTTON3_MASK               => 1 +< 10,
  CLUTTER_BUTTON4_MASK               => 1 +< 11,
  CLUTTER_BUTTON5_MASK               => 1 +< 12,
  CLUTTER_MODIFIER_RESERVED_13_MASK  => 1 +< 13,
  CLUTTER_MODIFIER_RESERVED_14_MASK  => 1 +< 14,
  CLUTTER_MODIFIER_RESERVED_15_MASK  => 1 +< 15,
  CLUTTER_MODIFIER_RESERVED_16_MASK  => 1 +< 16,
  CLUTTER_MODIFIER_RESERVED_17_MASK  => 1 +< 17,
  CLUTTER_MODIFIER_RESERVED_18_MASK  => 1 +< 18,
  CLUTTER_MODIFIER_RESERVED_19_MASK  => 1 +< 19,
  CLUTTER_MODIFIER_RESERVED_20_MASK  => 1 +< 20,
  CLUTTER_MODIFIER_RESERVED_21_MASK  => 1 +< 21,
  CLUTTER_MODIFIER_RESERVED_22_MASK  => 1 +< 22,
  CLUTTER_MODIFIER_RESERVED_23_MASK  => 1 +< 23,
  CLUTTER_MODIFIER_RESERVED_24_MASK  => 1 +< 24,
  CLUTTER_MODIFIER_RESERVED_25_MASK  => 1 +< 25,
  CLUTTER_SUPER_MASK                 => 1 +< 26,
  CLUTTER_HYPER_MASK                 => 1 +< 27,
  CLUTTER_META_MASK                  => 1 +< 28,
  CLUTTER_MODIFIER_RESERVED_29_MASK  => 1 +< 29,
  CLUTTER_RELEASE_MASK               => 1 +< 30,

  # Combination of CLUTTER_SHIFT_MASK..CLUTTER_BUTTON5_MASK + CLUTTER_SUPER_MASK
  # CLUTTER_HYPER_MASK + CLUTTER_META_MASK + CLUTTER_RELEASE_MASK
  CLUTTER_MODIFIER_MASK              => 0x5c001fff
);

constant MutterClutterOffscreenRedirect is export := guint32;
our enum MutterClutterOffscreenRedirectEnum is export (
  CLUTTER_OFFSCREEN_REDIRECT_AUTOMATIC_FOR_OPACITY => 1 +< 0,
  CLUTTER_OFFSCREEN_REDIRECT_ALWAYS                => 1 +< 1,
  CLUTTER_OFFSCREEN_REDIRECT_ON_IDLE               => 1 +< 2,
);

constant MutterClutterOrientation is export := guint32;
our enum MutterClutterOrientationEnum is export <
  CLUTTER_ORIENTATION_HORIZONTAL
  CLUTTER_ORIENTATION_VERTICAL
>;

constant MutterClutterPaintFlag is export := guint32;
our enum MutterClutterPaintFlagEnum is export (
  CLUTTER_PAINT_FLAG_NONE          =>      0,
  CLUTTER_PAINT_FLAG_NO_CURSORS    => 1 +< 0,
  CLUTTER_PAINT_FLAG_FORCE_CURSORS => 1 +< 1,
  CLUTTER_PAINT_FLAG_CLEAR         => 1 +< 2,
);

constant MutterClutterPanAxis is export := guint32;
our enum MutterClutterPanAxisEnum is export (
  CLUTTER_PAN_AXIS_NONE => 0,
  'CLUTTER_PAN_X_AXIS',
  'CLUTTER_PAN_Y_AXIS',
  'CLUTTER_PAN_AXIS_AUTO'
);

constant MutterClutterPickDebugFlag is export := guint32;
our enum MutterClutterPickDebugFlagEnum is export (
  CLUTTER_DEBUG_NOP_PICKING => 1 +< 0,
);

constant MutterClutterPickMode is export := guint32;
our enum MutterClutterPickModeEnum is export (
  CLUTTER_PICK_NONE     => 0,
  'CLUTTER_PICK_REACTIVE',
  'CLUTTER_PICK_ALL'
);

constant MutterClutterPreeditResetMode is export := guint32;
our enum MutterClutterPreeditResetModeEnum is export <
  CLUTTER_PREEDIT_RESET_CLEAR
  CLUTTER_PREEDIT_RESET_COMMIT
>;

constant MutterClutterRepaintFlags is export := guint32;
our enum MutterClutterRepaintFlagsEnum is export (
  CLUTTER_REPAINT_FLAGS_PRE_PAINT  => 1 +< 0,
  CLUTTER_REPAINT_FLAGS_POST_PAINT => 1 +< 1,
);

constant MutterClutterRequestMode is export := guint32;
our enum MutterClutterRequestModeEnum is export <
  CLUTTER_REQUEST_HEIGHT_FOR_WIDTH
  CLUTTER_REQUEST_WIDTH_FOR_HEIGHT
  CLUTTER_REQUEST_CONTENT_SIZE
>;

constant MutterClutterRotateAxis is export := guint32;
our enum MutterClutterRotateAxisEnum is export <
  CLUTTER_X_AXIS
  CLUTTER_Y_AXIS
  CLUTTER_Z_AXIS
>;

constant MutterClutterRotateDirection is export := guint32;
our enum MutterClutterRotateDirectionEnum is export <
  CLUTTER_ROTATE_CW
  CLUTTER_ROTATE_CCW
>;

constant MutterClutterScalingFilter is export := guint32;
our enum MutterClutterScalingFilterEnum is export <
  CLUTTER_SCALING_FILTER_LINEAR
  CLUTTER_SCALING_FILTER_NEAREST
  CLUTTER_SCALING_FILTER_TRILINEAR
>;

constant MutterClutterScriptError is export := guint32;
our enum MutterClutterScriptErrorEnum is export <
  CLUTTER_SCRIPT_ERROR_INVALID_TYPE_FUNCTION
  CLUTTER_SCRIPT_ERROR_INVALID_PROPERTY
  CLUTTER_SCRIPT_ERROR_INVALID_VALUE
>;


constant MutterClutterScrollMode is export := guint32;
our enum MutterClutterScrollModeEnum is export (
  CLUTTER_SCROLL_NONE         => 0,
  CLUTTER_SCROLL_HORIZONTALLY => 1 +< 0,
  CLUTTER_SCROLL_VERTICALLY   => 1 +< 1,
  CLUTTER_SCROLL_BOTH         => 1 +| (1 +< 1)
);

constant MutterClutterScrollDirection is export := guint32;
our enum MutterClutterScrollDirectionEnum is export <
  CLUTTER_SCROLL_UP
  CLUTTER_SCROLL_DOWN
  CLUTTER_SCROLL_LEFT
  CLUTTER_SCROLL_RIGHT
  CLUTTER_SCROLL_SMOOTH
>;

constant MutterClutterScrollFinishFlags is export := guint32;
our enum MutterClutterScrollFinishFlagsEnum is export (
  CLUTTER_SCROLL_FINISHED_NONE       =>      0,
  CLUTTER_SCROLL_FINISHED_HORIZONTAL => 1 +< 0,
  CLUTTER_SCROLL_FINISHED_VERTICAL   => 1 +< 1,
);

constant MutterClutterScrollSource is export := guint32;
our enum MutterClutterScrollSourceEnum is export <
  CLUTTER_SCROLL_SOURCE_UNKNOWN
  CLUTTER_SCROLL_SOURCE_WHEEL
  CLUTTER_SCROLL_SOURCE_FINGER
  CLUTTER_SCROLL_SOURCE_CONTINUOUS
>;

constant MutterClutterStaticColor is export := guint32;
our enum MutterClutterStaticColorEnum is export (
  CLUTTER_COLOR_WHITE           => 0,
  'CLUTTER_COLOR_BLACK',
  'CLUTTER_COLOR_RED',
  'CLUTTER_COLOR_DARK_RED',
  'CLUTTER_COLOR_GREEN',
  'CLUTTER_COLOR_DARK_GREEN',
  'CLUTTER_COLOR_BLUE',
  'CLUTTER_COLOR_DARK_BLUE',
  'CLUTTER_COLOR_CYAN',
  'CLUTTER_COLOR_DARK_CYAN',
  'CLUTTER_COLOR_MAGENTA',
  'CLUTTER_COLOR_DARK_MAGENTA',
  'CLUTTER_COLOR_YELLOW',
  'CLUTTER_COLOR_DARK_YELLOW',
  'CLUTTER_COLOR_GRAY',
  'CLUTTER_COLOR_DARK_GRAY',
  'CLUTTER_COLOR_LIGHT_GRAY',
  'CLUTTER_COLOR_BUTTER',
  'CLUTTER_COLOR_BUTTER_LIGHT',
  'CLUTTER_COLOR_BUTTER_DARK',
  'CLUTTER_COLOR_ORANGE',
  'CLUTTER_COLOR_ORANGE_LIGHT',
  'CLUTTER_COLOR_ORANGE_DARK',
  'CLUTTER_COLOR_CHOCOLATE',
  'CLUTTER_COLOR_CHOCOLATE_LIGHT',
  'CLUTTER_COLOR_CHOCOLATE_DARK',
  'CLUTTER_COLOR_CHAMELEON',
  'CLUTTER_COLOR_CHAMELEON_LIGHT',
  'CLUTTER_COLOR_CHAMELEON_DARK',
  'CLUTTER_COLOR_SKY_BLUE',
  'CLUTTER_COLOR_SKY_BLUE_LIGHT',
  'CLUTTER_COLOR_SKY_BLUE_DARK',
  'CLUTTER_COLOR_PLUM',
  'CLUTTER_COLOR_PLUM_LIGHT',
  'CLUTTER_COLOR_PLUM_DARK',
  'CLUTTER_COLOR_SCARLET_RED',
  'CLUTTER_COLOR_SCARLET_RED_LIGHT',
  'CLUTTER_COLOR_SCARLET_RED_DARK',
  'CLUTTER_COLOR_ALUMINIUM_1',
  'CLUTTER_COLOR_ALUMINIUM_2',
  'CLUTTER_COLOR_ALUMINIUM_3',
  'CLUTTER_COLOR_ALUMINIUM_4',
  'CLUTTER_COLOR_ALUMINIUM_5',
  'CLUTTER_COLOR_ALUMINIUM_6',
  'CLUTTER_COLOR_TRANSPARENT'
);

constant MutterClutterShaderType is export := guint32;
our enum MutterClutterShaderTypeEnum is export <
  CLUTTER_VERTEX_SHADER
  CLUTTER_FRAGMENT_SHADER
>;

constant MutterClutterSnapEdge is export := guint32;
our enum MutterClutterSnapEdgeEnum is export <
  CLUTTER_SNAP_EDGE_TOP
  CLUTTER_SNAP_EDGE_RIGHT
  CLUTTER_SNAP_EDGE_BOTTOM
  CLUTTER_SNAP_EDGE_LEFT
>;

constant MutterClutterStepMode is export := guint32;
our enum MutterClutterStepModeEnum is export <
  CLUTTER_STEP_MODE_START
  CLUTTER_STEP_MODE_END
>;

constant MutterClutterSwipeDirection is export := guint32;
our enum MutterClutterSwipeDirectionEnum is export (
  CLUTTER_SWIPE_DIRECTION_UP    => 1 +< 0,
  CLUTTER_SWIPE_DIRECTION_DOWN  => 1 +< 1,
  CLUTTER_SWIPE_DIRECTION_LEFT  => 1 +< 2,
  CLUTTER_SWIPE_DIRECTION_RIGHT => 1 +< 3,
);

constant MutterClutterTextDirection is export := guint32;
our enum MutterClutterTextDirectionEnum is export <
  CLUTTER_TEXT_DIRECTION_DEFAULT
  CLUTTER_TEXT_DIRECTION_LTR
  CLUTTER_TEXT_DIRECTION_RTL
>;

constant MutterClutterTextureQuality is export := guint32;
our enum MutterClutterTextureQualityEnum is export <
  CLUTTER_TEXTURE_QUALITY_LOW
  CLUTTER_TEXTURE_QUALITY_MEDIUM
  CLUTTER_TEXTURE_QUALITY_HIGH
>;

constant MutterClutterTimelineDirection is export := guint32;
our enum MutterClutterTimelineDirectionEnum is export <
  CLUTTER_TIMELINE_FORWARD
  CLUTTER_TIMELINE_BACKWARD
>;

constant MutterClutterTouchpadGesturePhase is export := guint32;
our enum MutterClutterTouchpadGesturePhaseEnum is export <
  CLUTTER_TOUCHPAD_GESTURE_PHASE_BEGIN
  CLUTTER_TOUCHPAD_GESTURE_PHASE_UPDATE
  CLUTTER_TOUCHPAD_GESTURE_PHASE_END
  CLUTTER_TOUCHPAD_GESTURE_PHASE_CANCEL
>;

constant MutterClutterUnitType is export := guint32;
our enum MutterClutterUnitTypeEnum is export <
  CLUTTER_UNIT_PIXEL
  CLUTTER_UNIT_EM
  CLUTTER_UNIT_MM
  CLUTTER_UNIT_POINT
  CLUTTER_UNIT_CM
>;

constant MutterClutterVirtualDeviceType is export := guint32;
our enum MutterClutterVirtualDeviceTypeEnum is export (
  CLUTTER_VIRTUAL_DEVICE_TYPE_NONE        =>      0,
  CLUTTER_VIRTUAL_DEVICE_TYPE_KEYBOARD    => 1 +< 0,
  CLUTTER_VIRTUAL_DEVICE_TYPE_POINTER     => 1 +< 1,
  CLUTTER_VIRTUAL_DEVICE_TYPE_TOUCHSCREEN => 1 +< 2,
);

constant MetaBarrierDirection is export := guint32;
our enum MetaBarrierDirectionEnum is export (
  META_BARRIER_DIRECTION_POSITIVE_X => 1 +< 0,
  META_BARRIER_DIRECTION_POSITIVE_Y => 1 +< 1,
  META_BARRIER_DIRECTION_NEGATIVE_X => 1 +< 2,
  META_BARRIER_DIRECTION_NEGATIVE_Y => 1 +< 3,
);

constant MetaButtonFunction is export := guint32;
our enum MetaButtonFunctionEnum is export <
  META_BUTTON_FUNCTION_MENU
  META_BUTTON_FUNCTION_MINIMIZE
  META_BUTTON_FUNCTION_MAXIMIZE
  META_BUTTON_FUNCTION_CLOSE
  META_BUTTON_FUNCTION_LAST
>;

constant MetaCloseDialogResponse is export := guint32;
our enum MetaCloseDialogResponseEnum is export <
  META_CLOSE_DIALOG_RESPONSE_WAIT
  META_CLOSE_DIALOG_RESPONSE_FORCE_CLOSE
>;

constant MetaCompEffect is export := guint32;
our enum MetaCompEffectEnum is export <
  META_COMP_EFFECT_CREATE
  META_COMP_EFFECT_UNMINIMIZE
  META_COMP_EFFECT_DESTROY
  META_COMP_EFFECT_MINIMIZE
  META_COMP_EFFECT_NONE
>;

constant MetaCursor is export := guint32;
our enum MetaCursorEnum is export (
  META_CURSOR_NONE                   => 0,
  'META_CURSOR_DEFAULT',
  'META_CURSOR_NORTH_RESIZE',
  'META_CURSOR_SOUTH_RESIZE',
  'META_CURSOR_WEST_RESIZE',
  'META_CURSOR_EAST_RESIZE',
  'META_CURSOR_SE_RESIZE',
  'META_CURSOR_SW_RESIZE',
  'META_CURSOR_NE_RESIZE',
  'META_CURSOR_NW_RESIZE',
  'META_CURSOR_MOVE_OR_RESIZE_WINDOW',
  'META_CURSOR_BUSY',
  'META_CURSOR_DND_IN_DRAG',
  'META_CURSOR_DND_MOVE',
  'META_CURSOR_DND_COPY',
  'META_CURSOR_DND_UNSUPPORTED_TARGET',
  'META_CURSOR_POINTING_HAND',
  'META_CURSOR_CROSSHAIR',
  'META_CURSOR_IBEAM',
  'META_CURSOR_BLANK',
  'META_CURSOR_LAST'
);

constant MetaDebugPaintFlag is export := guint32;
our enum MetaDebugPaintFlagEnum is export (
  META_DEBUG_PAINT_NONE          =>      0,
  META_DEBUG_PAINT_OPAQUE_REGION => 1 +< 0,
);

constant MetaDebugTopic is export := gint32;
our enum MetaDebugTopicEnum is export (
  META_DEBUG_VERBOSE         =>      -1,
  META_DEBUG_FOCUS           => 1 +<  0,
  META_DEBUG_WORKAREA        => 1 +<  1,
  META_DEBUG_STACK           => 1 +<  2,
  META_DEBUG_SM              => 1 +<  3,
  META_DEBUG_EVENTS          => 1 +<  4,
  META_DEBUG_WINDOW_STATE    => 1 +<  5,
  META_DEBUG_WINDOW_OPS      => 1 +<  6,
  META_DEBUG_GEOMETRY        => 1 +<  7,
  META_DEBUG_PLACEMENT       => 1 +<  8,
  META_DEBUG_PING            => 1 +<  9,
  META_DEBUG_KEYBINDINGS     => 1 +< 10,
  META_DEBUG_SYNC            => 1 +< 11,
  META_DEBUG_STARTUP         => 1 +< 12,
  META_DEBUG_PREFS           => 1 +< 13,
  META_DEBUG_GROUPS          => 1 +< 14,
  META_DEBUG_RESIZING        => 1 +< 15,
  META_DEBUG_SHAPES          => 1 +< 16,
  META_DEBUG_EDGE_RESISTANCE => 1 +< 17,
  META_DEBUG_DBUS            => 1 +< 18,
  META_DEBUG_INPUT           => 1 +< 19,
  META_DEBUG_WAYLAND         => 1 +< 20,
  META_DEBUG_KMS             => 1 +< 21,
  META_DEBUG_SCREEN_CAST     => 1 +< 22,
  META_DEBUG_REMOTE_DESKTOP  => 1 +< 23,
  META_DEBUG_BACKEND         => 1 +< 24,
  META_DEBUG_RENDER          => 1 +< 25,
);

constant MetaDisplayCorner is export := guint32;
our enum MetaDisplayCornerEnum is export <
  META_DISPLAY_TOPLEFT
  META_DISPLAY_TOPRIGHT
  META_DISPLAY_BOTTOMLEFT
  META_DISPLAY_BOTTOMRIGHT
>;

constant MetaDisplayDirection is export := guint32;
our enum MetaDisplayDirectionEnum is export <
  META_DISPLAY_UP
  META_DISPLAY_DOWN
  META_DISPLAY_LEFT
  META_DISPLAY_RIGHT
>;

constant MetaEdgeType is export := guint32;
our enum MetaEdgeTypeEnum is export <
  META_EDGE_WINDOW
  META_EDGE_MONITOR
  META_EDGE_SCREEN
>;

constant MetaExitCode is export := guint32;
our enum MetaExitCodeEnum is export <
  META_EXIT_SUCCESS
  META_EXIT_ERROR
>;

constant MetaFrameFlags is export := guint32;
our enum MetaFrameFlagsEnum is export (
  META_FRAME_ALLOWS_DELETE            =>  1 +< 0,
  META_FRAME_ALLOWS_MENU              =>  1 +< 1,
  META_FRAME_ALLOWS_MINIMIZE          =>  1 +< 2,
  META_FRAME_ALLOWS_MAXIMIZE          =>  1 +< 3,
  META_FRAME_ALLOWS_VERTICAL_RESIZE   =>  1 +< 4,
  META_FRAME_ALLOWS_HORIZONTAL_RESIZE =>  1 +< 5,
  META_FRAME_HAS_FOCUS                =>  1 +< 6,
  META_FRAME_SHADED                   =>  1 +< 7,
  META_FRAME_STUCK                    =>  1 +< 8,
  META_FRAME_MAXIMIZED                =>  1 +< 9,
  META_FRAME_ALLOWS_SHADE             => 1 +< 10,
  META_FRAME_ALLOWS_MOVE              => 1 +< 11,
  META_FRAME_FULLSCREEN               => 1 +< 12,
  META_FRAME_ABOVE                    => 1 +< 13,
  META_FRAME_TILED_LEFT               => 1 +< 14,
  META_FRAME_TILED_RIGHT              => 1 +< 15,
);

constant MetaFrameType is export := guint32;
our enum MetaFrameTypeEnum is export <
  META_FRAME_TYPE_NORMAL
  META_FRAME_TYPE_DIALOG
  META_FRAME_TYPE_MODAL_DIALOG
  META_FRAME_TYPE_UTILITY
  META_FRAME_TYPE_MENU
  META_FRAME_TYPE_BORDER
  META_FRAME_TYPE_ATTACHED
  META_FRAME_TYPE_LAST
>;

constant MetaGravity is export := guint32;
our enum MetaGravityEnum is export (
  META_GRAVITY_NONE       =>  0,
  META_GRAVITY_NORTH_WEST =>  1,
  META_GRAVITY_NORTH      =>  2,
  META_GRAVITY_NORTH_EAST =>  3,
  META_GRAVITY_WEST       =>  4,
  META_GRAVITY_CENTER     =>  5,
  META_GRAVITY_EAST       =>  6,
  META_GRAVITY_SOUTH_WEST =>  7,
  META_GRAVITY_SOUTH      =>  8,
  META_GRAVITY_SOUTH_EAST =>  9,
  META_GRAVITY_STATIC     => 10,
);

constant MetaInhibitShortcutsDialogResponse is export := guint32;
our enum MetaInhibitShortcutsDialogResponseEnum is export <
  META_INHIBIT_SHORTCUTS_DIALOG_RESPONSE_ALLOW
  META_INHIBIT_SHORTCUTS_DIALOG_RESPONSE_DENY
>;

constant MetaKeyBindingFlags is export := guint32;
our enum MetaKeyBindingFlagsEnum is export (
  'META_KEY_BINDING_NONE',
  META_KEY_BINDING_PER_WINDOW        => 1 +< 0,
  META_KEY_BINDING_BUILTIN           => 1 +< 1,
  META_KEY_BINDING_IS_REVERSED       => 1 +< 2,
  META_KEY_BINDING_NON_MASKABLE      => 1 +< 3,
  META_KEY_BINDING_IGNORE_AUTOREPEAT => 1 +< 4,
  META_KEY_BINDING_NO_AUTO_GRAB      => 1 +< 5,
);

constant MetaLaterType is export := guint32;
our enum MetaLaterTypeEnum is export <
  META_LATER_RESIZE
  META_LATER_CALC_SHOWING
  META_LATER_CHECK_FULLSCREEN
  META_LATER_SYNC_STACK
  META_LATER_BEFORE_REDRAW
  META_LATER_IDLE
>;

constant MetaLocaleDirection is export := guint32;
our enum MetaLocaleDirectionEnum is export <
  META_LOCALE_DIRECTION_LTR
  META_LOCALE_DIRECTION_RTL
>;

constant MetaMonitorSwitchConfigType is export := guint32;
our enum MetaMonitorSwitchConfigTypeEnum is export <
  META_MONITOR_SWITCH_CONFIG_ALL_MIRROR
  META_MONITOR_SWITCH_CONFIG_ALL_LINEAR
  META_MONITOR_SWITCH_CONFIG_EXTERNAL
  META_MONITOR_SWITCH_CONFIG_BUILTIN
  META_MONITOR_SWITCH_CONFIG_UNKNOWN
>;

constant MetaMotionDirection is export := gint32;
our enum MetaMotionDirectionEnum is export (
  META_MOTION_UP         => -1,
  META_MOTION_DOWN       => -2,
  META_MOTION_LEFT       => -3,
  META_MOTION_RIGHT      => -4,
  META_MOTION_UP_LEFT    => -5,
  META_MOTION_UP_RIGHT   => -6,
  META_MOTION_DOWN_LEFT  => -7,
  META_MOTION_DOWN_RIGHT => -8,
);

constant MetaPadActionType is export := guint32;
our enum MetaPadActionTypeEnum is export <
  META_PAD_ACTION_BUTTON
  META_PAD_ACTION_RING
  META_PAD_ACTION_STRIP
>;

constant MetaPreference is export := guint32;
our enum MetaPreferenceEnum is export <
  META_PREF_MOUSE_BUTTON_MODS
  META_PREF_FOCUS_MODE
  META_PREF_FOCUS_NEW_WINDOWS
  META_PREF_ATTACH_MODAL_DIALOGS
  META_PREF_RAISE_ON_CLICK
  META_PREF_ACTION_DOUBLE_CLICK_TITLEBAR
  META_PREF_ACTION_MIDDLE_CLICK_TITLEBAR
  META_PREF_ACTION_RIGHT_CLICK_TITLEBAR
  META_PREF_AUTO_RAISE
  META_PREF_AUTO_RAISE_DELAY
  META_PREF_FOCUS_CHANGE_ON_POINTER_REST
  META_PREF_TITLEBAR_FONT
  META_PREF_NUM_WORKSPACES
  META_PREF_DYNAMIC_WORKSPACES
  META_PREF_KEYBINDINGS
  META_PREF_DISABLE_WORKAROUNDS
  META_PREF_BUTTON_LAYOUT
  META_PREF_WORKSPACE_NAMES
  META_PREF_VISUAL_BELL
  META_PREF_AUDIBLE_BELL
  META_PREF_VISUAL_BELL_TYPE
  META_PREF_GNOME_ACCESSIBILITY
  META_PREF_GNOME_ANIMATIONS
  META_PREF_CURSOR_THEME
  META_PREF_CURSOR_SIZE
  META_PREF_RESIZE_WITH_RIGHT_BUTTON
  META_PREF_EDGE_TILING
  META_PREF_FORCE_FULLSCREEN
  META_PREF_WORKSPACES_ONLY_ON_PRIMARY
  META_PREF_DRAGGABLE_BORDER_WIDTH
  META_PREF_AUTO_MAXIMIZE
  META_PREF_CENTER_NEW_WINDOWS
  META_PREF_DRAG_THRESHOLD
  META_PREF_LOCATE_POINTER
  META_PREF_CHECK_ALIVE_TIMEOUT
>;

constant MetaSelectionType is export := guint32;
our enum MetaSelectionTypeEnum is export <
  META_SELECTION_PRIMARY
  META_SELECTION_CLIPBOARD
  META_SELECTION_DND
  META_N_SELECTION_TYPES
>;

constant MetaShadowMode is export := guint32;
our enum MetaShadowModeEnum is export <
  META_SHADOW_MODE_AUTO
  META_SHADOW_MODE_FORCED_OFF
  META_SHADOW_MODE_FORCED_ON
>;

constant MetaDirection is export := guint32;
our enum MetaDirectionEnum is export (
  META_DIRECTION_LEFT       => 1 +< 0,
  META_DIRECTION_RIGHT      => 1 +< 1,
  META_DIRECTION_TOP        => 1 +< 2,
  META_DIRECTION_BOTTOM     => 1 +< 3,
  META_DIRECTION_UP         => 1 +< 2,
  META_DIRECTION_DOWN       => 1 +< 3,
  META_DIRECTION_HORIZONTAL => 1 +< 0 +| 1 +< 1,
  META_DIRECTION_VERTICAL   => 1 +< 2 +| 1 +< 3,
);

constant MetaSide is export := guint32;
our enum MetaSideEnum is export (
  META_SIDE_LEFT   =>   META_DIRECTION_LEFT,
  META_SIDE_RIGHT  =>  META_DIRECTION_RIGHT,
  META_SIDE_TOP    =>    META_DIRECTION_TOP,
  META_SIDE_BOTTOM => META_DIRECTION_BOTTOM,
);

constant MetaSizeChange is export := guint32;
our enum MetaSizeChangeEnum is export <
  META_SIZE_CHANGE_MAXIMIZE
  META_SIZE_CHANGE_UNMAXIMIZE
  META_SIZE_CHANGE_FULLSCREEN
  META_SIZE_CHANGE_UNFULLSCREEN
>;

constant MetaStackLayer is export := guint32;
our enum MetaStackLayerEnum is export (
  META_LAYER_DESKTOP           => 0,
  META_LAYER_BOTTOM            => 1,
  META_LAYER_NORMAL            => 2,
  META_LAYER_TOP               => 4,
  META_LAYER_DOCK              => 4,
  META_LAYER_OVERRIDE_REDIRECT => 7,
  META_LAYER_LAST              => 8,
);

constant MetaTabList is export := guint32;
our enum MetaTabListEnum is export <
  META_TAB_LIST_NORMAL
  META_TAB_LIST_DOCKS
  META_TAB_LIST_GROUP
  META_TAB_LIST_NORMAL_ALL
>;

constant MetaTabShowType is export := guint32;
our enum MetaTabShowTypeEnum is export <
  META_TAB_SHOW_ICON
  META_TAB_SHOW_INSTANTLY
>;

constant MetaWindowMenuType is export := guint32;
our enum MetaWindowMenuTypeEnum is export <
  META_WINDOW_MENU_WM
  META_WINDOW_MENU_APP
>;

constant MetaWindowType is export := guint32;
our enum MetaWindowTypeEnum is export <
  META_WINDOW_NORMAL
  META_WINDOW_DESKTOP
  META_WINDOW_DOCK
  META_WINDOW_DIALOG
  META_WINDOW_MODAL_DIALOG
  META_WINDOW_TOOLBAR
  META_WINDOW_MENU
  META_WINDOW_UTILITY
  META_WINDOW_SPLASHSCREEN
  META_WINDOW_DROPDOWN_MENU
  META_WINDOW_POPUP_MENU
  META_WINDOW_TOOLTIP
  META_WINDOW_NOTIFICATION
  META_WINDOW_COMBO
  META_WINDOW_DND
  META_WINDOW_OVERRIDE_OTHER
>;
