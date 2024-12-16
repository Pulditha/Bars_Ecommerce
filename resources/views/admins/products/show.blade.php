{{-- @extends('layouts.admin-nav')

@section('content')
<div class="container mx-auto p-4">
    <h1 class="text-2xl font-bold mb-6">Product Details</h1>

    <div class="bg-white shadow-md rounded-lg p-6">
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Name:</h2>
            <p class="text-gray-700">{{ $product->name }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Category:</h2>
            <p class="text-gray-700">{{ $product->category }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Description:</h2>
            <p class="text-gray-700">{{ $product->description ?? 'N/A' }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Price:</h2>
            <p class="text-gray-700">{{ $product->currency }} {{ $product->price }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Stock Status:</h2>
            <p class="text-gray-700">{{ $product->stock_status }}</p>
        </div>

        <div class="mb-4">
            <h2 class="font-semibold text-lg">Brand:</h2>
            <p class="text-gray-700">{{ $product->brand ?? 'N/A' }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Weight:</h2>
            <p class="text-gray-700">{{ $product->weight ?? 'N/A' }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Ingredients:</h2>
            <p class="text-gray-700">{{ $product->ingredients ?? 'N/A' }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Allergy Information:</h2>
            <p class="text-gray-700">{{ $product->allergy_info ?? 'N/A' }}</p>
        </div>
        <div class="mb-4">
            <h2 class="font-semibold text-lg">Storage Instructions:</h2>
            <p class="text-gray-700">{{ $product->storage_instructions ?? 'N/A' }}</p>
        </div>

        @if ($product->images)
            <div class="mb-4">
                <h2 class="font-semibold text-lg">Images:</h2>
                <div class="grid grid-cols-3 gap-4">
                    @foreach (json_decode($product->images) as $image)
                        <img src="{{ asset('storage/' . $image) }}" class="w-full h-32 object-cover rounded-md">
                    @endforeach
                </div>
            </div>
        @endif

        <a href="{{ route('products.index') }}" class="bg-blue-500 text-white px-4 py-2 rounded">Back to Products</a>
    </div>
</div>

<div class="text-center text-sm text-white-600 mt-10 text-gray-500">
    Created by : Pulditha Wathsal | CB011498 | CB011498@students.apiit.lk
</div>


@endsection --}}
