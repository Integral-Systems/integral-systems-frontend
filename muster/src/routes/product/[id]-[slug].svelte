<script context="module">
  import { getProduct } from '$lib/api';
	export async function load({ fetch, page }) {
    const product = await getProduct(fetch, page.params.id);
    return { props: { product } };
  }
</script>

<script>
  import { getMediaUrl } from '$lib/api';
  import DynamicZone from "$lib/DynamicZone.svelte";
  import Image from "$lib/Image.svelte";

  export let product;
</script>

<Image src={getMediaUrl(product.scene)} class="w-full" ratio="23/11" />

<section class="m-4">
  <h1 class="text-2xl">{product?.name}</h1>
</section>

<DynamicZone components={product.content} />