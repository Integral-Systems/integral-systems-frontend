<script>
  import { goto } from '$app/navigation';
  import Card from '$lib/Card.svelte';
  import { getMediaUrl } from '$lib/api';

  export let products = [];

  function gotoProduct(product) {
    goto(`/product/${product.id}-${product.slug}`);
  }
</script>

<section class="grid md:grid-cols-3 sm:grid-cols-2 grid-cols gap-4 m-4">
  {#each products as product}
      <Card image={getMediaUrl(product.avatar)} caption={product.name} class="cursor-pointer" on:click={gotoProduct(product)} />
  {/each}
  </section>