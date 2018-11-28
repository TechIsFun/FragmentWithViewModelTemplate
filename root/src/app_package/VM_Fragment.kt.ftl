package ${packageName}

//import android.arch.lifecycle.*
import androidx.lifecycle.*
import android.content.Context
import android.os.Bundle
import android.os.Parcelable
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import dagger.android.support.AndroidSupportInjection
import ${packageName}.R
import javax.inject.Inject

class ${className}Fragment: Fragment() {

    companion object {
        fun newInstance() = ${className}Fragment()
    }

    private lateinit var viewModel: ${className}ViewModel

    @Inject
    lateinit var viewModelFactory: ${className}ViewModelFactory

    <#if useDatabinding>
    private lateinit var binding: ViewDataBinding
    </#if>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        AndroidSupportInjection.inject(this)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
    <#if useDatabinding>
        binding = DataBindingUtil.inflate<ViewDataBinding>(inflater, R.layout.${fragmentName}, container, false)
        binding.setLifecycleOwner(this)

        val view = binding.root
    <#else>
        val view = inflater.inflate(R.layout.${fragmentName}, container, false)
    </#if>

        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewModel = ViewModelProviders.of(this, viewModelFactory).get(${className}ViewModel::class.java)
        
        binding.setVariable(BR.viewModel, viewModel)
        binding.executePendingBindings()

        viewModel.loadingLiveData.observe(this, Observer {
            renderLoading(it == true)
        })

        viewModel.errorLiveData.observe(this, Observer {
            it?.let{ renderError(it) }
        })

        viewModel.uiModelLiveData.observe(this, Observer {
            it?.let{ renderUiModel(it) }
        })

<#if hasNavigateNext>
        viewModel.navigateNext.observe(this, Observer {
            navigate(R.id.)
        })
</#if>
    }

<#if useRecyclerView>
    private fun renderUiModel(uiModel: ${className}ListUiModel) {
        binding.setVariable(BR.model, uiModel)
        recyclerView.adapter = ${className}Adapter(uiModel.items, viewModel)
        binding.executePendingBindings()
<#elseif useDatabinding>
    private fun renderUiModel(uiModel: ${className}UiModel) {
        binding.setVariable(BR.model, uiModel)
        binding.executePendingBindings() 
<#else>
        // TODO        
</#if>
    }

    private fun renderLoading(isLoading: Boolean) {
	   activity?.renderLoading(isLoading)
    }

    private fun renderError(error: Exception) {
	   activity?.renderError(error)
    }

}

<#if useRecyclerView>
private class ${className}Adapter(items: List<Any>, viewModel: ViewModel) : DataBindingRecyclerViewAdapter(items, viewModel) {
    override fun getLayoutIdForPosition(position: Int): Int {
        val item = getObjForPosition(position)
        return when (item) {
            is MyItemModel -> R.layout.item_layout
            else -> throw RuntimeException("unknown model: $item")
        }
    }
}
</#if>
