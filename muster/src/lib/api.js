export const baseUrl = function() {
  let url = import.meta.env.VITE_API_URL;
  if (url.endsWith('/')) return url.substr(0, url.length-1);
  else return url;
}();

function request(fetch, method, url, body) {
  return fetch(`${baseUrl}${url}`, { method, body })
    .then(res => res.json());
}

export function getPages() {
  return request(fetch, 'GET', '/pages');
}

export function getPage(fetch, id) {
  return request(fetch, 'GET', `/pages/${id}`);
}

export function getConfiguration(fetch) {
  return request(fetch, 'GET', '/configuration ');
}

export function getProduct(fetch, id) {
  return request(fetch, 'GET', `/products/${id}`);
}

export function getMediaUrl(media) {
  return `${baseUrl}${media.url}`;
}
