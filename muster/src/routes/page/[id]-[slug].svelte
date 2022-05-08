<script context="module">
	import { getPage } from '$lib/api.js';

	export async function load({ fetch, page }) {
		const data = await getPage(fetch, page.params.id);
		return { props: { page: data } };
	}
</script>

<script>
	import DynamicZone from '$lib/DynamicZone.svelte';
	export let page = null;
</script>

<DynamicZone components={page.content}></DynamicZone>



