cmake_minimum_required(VERSION 3.24)
project(
	tint
	LANGUAGES CXX
)

set(TINT_CORE_SOURCES
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/binary_op.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/unary_op.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/number.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/fluent_types.h"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/type.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/abstract_float.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/abstract_int.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/abstract_numeric.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/array.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/array_count.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/atomic.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/bool.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/f16.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/f32.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/i32.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/matrix.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/pointer.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/reference.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/scalar.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/struct.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/texture.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/texture_dimension.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/u32.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/vector.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/void.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/manager.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/type/clone_context.h"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/value.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/scalar.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/composite.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/manager.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/node.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/splat.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/core/constant/eval.cc"
)

set(TINT_WGSL_SOURCES
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reader/reader.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reader/parser/lexer.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reader/parser/parser.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reader/parser/token.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reader/lower/lower.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/resolver.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/resolve.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/validator.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/uniformity.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/sem_helper.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/resolver/dependency_graph.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/program/program.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/program/program_builder.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/program/clone_context.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/module.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/attribute.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/binary_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/block_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/bool_literal_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/call_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/float_literal_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/for_loop_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/function.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/identifier_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/if_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/int_literal_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/let.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/literal_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/loop_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/member_accessor_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/return_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/struct.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/switch_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/type.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/unary_op_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/var.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/variable.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/while_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/builder.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/ast/clone_context.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/array.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/array_count.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/block_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/call.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/call_target.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/for_loop_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/function.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/if_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/loop_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/member_accessor_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/module.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/node.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/struct.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/switch_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/value_expression.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/variable.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/sem/while_statement.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/reserved_words.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/wgsl/builtin_fn.cc"
)

set(TINT_SPIRV_SOURCES
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/writer.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/binary_writer.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/function.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/instruction.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/module.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/operand.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/common/output.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/raise.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/builtin_polyfill.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/expand_implicit_splats.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/handle_matrix_arithmetic.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/merge_return.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/writer/raise/var_for_dynamic_index.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/builtin_fn.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/intrinsic/data.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/type/explicit_layout_array.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/type/image.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/lang/spirv/type/sampled_image.cc"
)

set(TINT_UTILS_SOURCES
	"${PROJECT_SOURCE_DIR}/src/tint/utils/diagnostic/diagnostic.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/diagnostic/formatter.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/diagnostic/source.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/ice/ice.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/math/math.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/memory/memory.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/reflection.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/result.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/rtti/castable.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/rtti/switch.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/strconv/float_to_string.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/strconv/parse_num.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/symbol/symbol.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/symbol/symbol_table.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/text/string.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/text/string_stream.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/text/unicode.cc"
	"${PROJECT_SOURCE_DIR}/src/tint/utils/text_generator/text_generator.cc"
)

set(FETCHCONTENT_QUIET FALSE)
include(FetchContent)

add_library(${PROJECT_NAME} STATIC)

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)

target_compile_definitions(
	${PROJECT_NAME} PUBLIC
		"TINT_BUILD_WGSL_READER=1"
		"TINT_BUILD_SPV_WRITER=1"
)

target_include_directories(
	${PROJECT_NAME} PUBLIC
		"${PROJECT_SOURCE_DIR}"
		"${PROJECT_SOURCE_DIR}/include"
)

target_sources(
	${PROJECT_NAME} PRIVATE
		${TINT_CORE_SOURCES}
		${TINT_WGSL_SOURCES}
		${TINT_SPIRV_SOURCES}
		${TINT_UTILS_SOURCES}
)

if(NOT TARGET SPIRV-Headers::SPIRV-Headers)
	FetchContent_Declare(
		spirv_headers
		GIT_REPOSITORY "git@github.com:KhronosGroup/SPIRV-Headers.git"
		GIT_TAG main
		GIT_PROGRESS TRUE
	)
	FetchContent_MakeAvailable(spirv_headers)
endif()

target_link_libraries(
	${PROJECT_NAME} PRIVATE
		SPIRV-Headers::SPIRV-Headers
)
