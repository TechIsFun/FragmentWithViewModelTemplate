package ${packageName}

import com.andreamaglie.domain.MediatorUseCase
import com.andreamaglie.domain.Repository
import com.andreamaglie.domain.Result
import timber.log.Timber
import java.lang.Exception
import javax.inject.Inject

class ${className}UseCase @Inject constructor(private val repository: Repository): MediatorUseCase<${className}UseCaseParams, Unit>() {
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

data class ${className}UseCaseParams(
    val param1: String,
    val param2: String
)