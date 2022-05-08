<script>
import { goto } from "$app/navigation";

  export let alias;
  export let page;

  let caption = alias ?? page?.name;
  let url = page ? `/page/${page.id}-${page.slug}` : '/';
</script>

<a href={url} on:click={() => goto(url)} class="px-4 py-2 hover:text-primary text-lg">{caption}</a>