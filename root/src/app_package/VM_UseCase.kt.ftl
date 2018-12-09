package ${packageName}

import com.andreamaglie.domain.*
import timber.log.Timber
import java.lang.Exception
import javax.inject.Inject

<#if usePagingLibrary>
class ${className}UseCase @Inject constructor(private val repository: Repository): PaginatedUseCase<${className}UseCaseParams, ${className}Model>() {

    override suspend fun execute(parameters: ${className}UseCaseParams) {
        result.postValue(Result.Loading)

        try {
            // TODO
            result.postValue(Result.Success(Unit))
        } catch (e: Exception) {
            Timber.w(e)
            result.postValue(Result.Error(e))
        }
    }
}
<#else>
class ${className}UseCase @Inject constructor(private val repository: Repository): MediatorUseCase<${className}UseCaseParams, Unit>() {

    override fun execute(parameters: ${className}Params, pagedListConfig: PagedList.Config): PagedResult<${className}Model> {
        return repository.query${className}(pagedListConfig)
    }
}
</#if>


data class ${className}UseCaseParams(
    val param1: String,
    val param2: String
)