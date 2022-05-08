<script>
  import marked from 'marked';

  export let content;
  console.log(marked(content));
</script>

<section class="m-4 text-base">
  {@html marked(content)}
</section>