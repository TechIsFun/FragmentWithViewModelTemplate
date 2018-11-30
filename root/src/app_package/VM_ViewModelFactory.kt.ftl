package ${packageName}

import androidx.lifecycle.*
import kotlinx.coroutines.CoroutineDispatcher
import javax.inject.Inject

class ${className}ViewModelFactory @Inject constructor(
            private val coroutineDispatcher: Provider<CoroutineDispatcher>,
            private val useCase: Provider<${className}UseCase>
    ): ViewModelProvider.Factory {

    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(${className}ViewModel::class.java)) {
            return ${className}ViewModel(
                    coroutineDispatcher = coroutineDispatcher.get(),
                    useCase = useCase.get()
            ) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }

}
