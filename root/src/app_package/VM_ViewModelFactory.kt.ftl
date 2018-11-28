package ${packageName}

import androidx.lifecycle.*
import kotlinx.coroutines.CoroutineDispatcher
import javax.inject.Inject

class ${className}ViewModelFactory @Inject constructor(
            private val coroutineDispatcher: CoroutineDispatcher,
            private val useCase: ${className}UseCase
    ): ViewModelProvider.Factory {

    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(${className}ViewModel::class.java)) {
            return ${className}ViewModel(
                    coroutineDispatcher = coroutineDispatcher,
                    useCase = useCase
            ) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }

}
