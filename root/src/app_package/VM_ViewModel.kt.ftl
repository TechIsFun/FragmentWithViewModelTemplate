package ${packageName}

//import android.arch.lifecycle.*
import androidx.lifecycle.*
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Job

class ${className}ViewModel(coroutineDispatcher: CoroutineDispatcher, 
							private val useCase: ${className}UseCase): ViewModel() {

	private val viewModelJob = Job()

	private val uiScope = CoroutineScope(coroutineDispatcher + viewModelJob)

	private val uiModelMapper by lazy { ${className}UiModelMapper() }

    private val _uiModelLiveData = MediatorLiveData<${className}UiModel>()
    val uiModelLiveData: LiveData<${className}UiModel>
        get() = _uiModelLiveData

    private val _loadingLiveData = MediatorLiveData<Boolean>()
    val loadingLiveData: LiveData<Boolean>
        get() = _loadingLiveData

    private val _errorLiveData = SingleLiveEvent<Exception>()
    val errorLiveData: LiveData<Exception>
        get() = _errorLiveData

<#if hasNavigateNext>
    private val _navigateNext = SingleLiveEvent<Any>()
    val navigateNext : LiveData<Any>
        get() = _navigateNext
</#if>

	init {
        val observable = useCase.observe()
        
<#if hasNavigateNext>
        _navigateNext.removeSource(observable)
        _navigateNext.addSource(observable) {
            if (it.succeeded) _navigateNext.call()
        }
</#if>

        _loadingLiveData.removeSource(observable)
        _loadingLiveData.addSource(observable) {
            _loadingLiveData.postValue(it == Result.Loading)
        }

        _errorLiveData.removeSource(observable)
        _errorLiveData.addSource(observable) {
            if (it is Result.Error) _errorLiveData.postValue(it.exception)
        }

		_uiModelLiveData.addSource(observable) {
            if (it is Result.Success) {
                val model = it.data
                _uiModelLiveData.postValue(uiModelMapper.map(model))
            }
        }

        _uiModelLiveData.postValue(${className}UiModel())

         uiScope.launch { useCase.execute(Unit) }
    }

    override fun onCleared() {
        super.onCleared()
        viewModelJob.cancel()
    }
    
    private fun updateModel(updateBlock: (${className}UiModel) -> Unit) {
        _uiModelLiveData.value?.let {
            updateBlock(it)
            _uiModelLiveData.postValue(it)
        }
    }

}
