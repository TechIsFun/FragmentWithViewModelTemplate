package ${packageName}

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.*
import org.junit.*
import kotlinx.coroutines.*

class ${className}ViewModelTest {

    @get:Rule
    val instantTaskExecutorRule = InstantTaskExecutorRule()

    private val coroutineDispatcher = Dispatchers.Default

    @RelaxedMockK lateinit var useCase: ${className}UseCase

    lateinit var viewModel: ${className}ViewModel

    @Before
    fun setup() {
        MockKAnnotations.init(this)

        runBlocking {
            viewModel = ${className}ViewModel(
                coroutineDispatcher = coroutineDispatcher,
                useCase = useCase
            )
        }
    }

	@Test
    fun testMyFunction() {
        // TODO
    }

}
