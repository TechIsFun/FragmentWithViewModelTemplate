<?xml version="1.0"?>
<recipe>

    <instantiate from="src/app_package/VM_Fragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}Fragment.kt" />
    <instantiate from="src/app_package/VM_ViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}ViewModel.kt" />
    <instantiate from="src/app_package/VM_ViewModelFactory.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}ViewModelFactory.kt" />
    <instantiate from="src/app_package/VM_UiModel.kt.ftl" 
                   to="${escapeXmlAttribute(srcOut)}/${className}UiModel.kt" />
    <instantiate from="src/app_package/VM_UseCase.kt.ftl" 
                   to="${escapeXmlAttribute(srcOut)}/${className}UseCase.kt" />
    <instantiate from="src/app_package/VM_UiModelMapper.kt.ftl" 
                   to="${escapeXmlAttribute(srcOut)}/${className}UiModelMapper.kt" />
    <instantiate from="test/app_package/VM_ViewModelTest.kt.ftl" 
                   to="${escapeXmlAttribute(testOut)}/${className}ViewModelTest.kt" />

    <open file="${srcOut}/${className}Fragment.kt"/>

    <#if includeLayout>
        <instantiate from="res/layout/fragment_layout.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />
    </#if>

</recipe>
