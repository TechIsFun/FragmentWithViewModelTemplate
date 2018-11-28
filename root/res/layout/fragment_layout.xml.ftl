<?xml version="1.0" encoding="utf-8"?>

<#if useDatabinding>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">

	<data>
		<variable
        	name="model"
       		type="${packageName}.${className}UiModel"/>

   		   <variable
            name="viewModel"
            type="${packageName}.${className}ViewModel"/>
	</data>
</#if>


	<LinearLayout 
		android:layout_width="match_parent"
	    android:layout_height="match_parent"
	    android:orientation="vertical"
	    tools:context="${packageName}.${className}Fragment">

	    <androidx.appcompat.widget.Toolbar
            android:id="@+id/toolbar"
            android:layout_width="match_parent"
            android:layout_height="?attr/actionBarSize"
            app:layout_scrollFlags="scroll|enterAlways"
            app:popupTheme="@style/AppTheme.PopupOverlay"
            app:navigationIcon="@drawable/ic_back_button"
            android:background="@color/white"
            >

            <TextView
                android:id="@+id/toolbar_title"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_gravity="center"
                android:text="@string/"
                android:textAppearance="@style/ToolbarTextAppereance"/>

        </androidx.appcompat.widget.Toolbar>

<#if useRecyclerView>
    	<androidx.recyclerview.widget.RecyclerView
            android:id="@+id/recyclerView"
            android:layout_width="match_parent"
            android:layout_height="0dp"
            android:layout_weight="1"
            android:background="#FBFBFB"
            app:layoutManager="androidx.recyclerview.widget.LinearLayoutManager"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            app:layout_constraintTop_toBottomOf="@id/toolbar"
            tools:listitem="@layout/item_layout"/>
</#if>

 <#if useDatabinding>
 		<!--
 		<TextView
 			android:layout_width="wrap_content"
	        android:layout_height="wrap_content"
    		android:id="@+id/text1"
    		android:text="@{model.field1}"
		/>
		-->

 		<!--
 		<EditText
 			android:layout_width="wrap_content"
	        android:layout_height="wrap_content"
    		android:id="@+id/editText"
    		android:text="@={model.field2}"
		/>
		-->

		<!--
 		<Button
 			android:layout_width="wrap_content"
	        android:layout_height="wrap_content"
    		android:text="@{() -> viewModel.onClick(model)}"
		/>
		-->
 </#if>


	</LinearLayout>

<#if useDatabinding>
</layout>
</#if>
