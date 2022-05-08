<script>
  import Banner from './components/Banner.svelte';
  import Facebook from './components/Facebook.svelte';
import Instagram from './components/Instagram.svelte';
  import Navigation from './components/Navigation.svelte';
  import ProductGrid from './components/ProductGrid.svelte';
  import RichText from './components/RichText.svelte';

  export let components = [];

  function getComponent(name) {
    switch (name) {
      case 'product.grid': return ProductGrid;
      case 'content.rich-text': return RichText;
      case 'content.banner': return Banner;
      case 'social.facebook': return Facebook;
      case 'social.instagram': return Instagram;
      case 'navigation.page': return Navigation;
      default: throw `invalid component: ${name}`;
    }
  }

  function bindComponent(component) {
    let copy = { ...component};
    delete copy.id;
    delete copy.__component;
    return copy;
  }
</script>

{#each components as component}
  <svelte:component this={getComponent(component.__component)} {...bindComponent(component)} />
{/each}