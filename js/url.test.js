test('WHATWG URL standard - auth url', () => {
    const testUrl = new URL('https://user:pass@sub.example.com:8080/p/a/t/h?query=string#hash');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('user');
    expect(testUrl.password).toBe('pass');
    expect(testUrl.host).toBe('sub.example.com:8080');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('8080');
    expect(testUrl.origin).toBe('https://sub.example.com:8080');
    expect(testUrl.pathname).toBe('/p/a/t/h');
    expect(testUrl.search).toBe('?query=string');
    expect(testUrl.searchParams.get('query')).toBe('string');
    expect(testUrl.hash).toBe('#hash');
});

test('WHATWG URL standard - host:port', () => {
    const testUrl = new URL('https://sub.example.com:8080/p/a/t/h?query=string#hash');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('');
    expect(testUrl.password).toBe('');
    expect(testUrl.host).toBe('sub.example.com:8080');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('8080');
    expect(testUrl.origin).toBe('https://sub.example.com:8080');
    expect(testUrl.pathname).toBe('/p/a/t/h');
    expect(testUrl.search).toBe('?query=string');
    expect(testUrl.searchParams.get('query')).toBe('string');
    expect(testUrl.hash).toBe('#hash');
    expect(testUrl.href).toBe('https://sub.example.com:8080/p/a/t/h?query=string#hash');
});

test('WHATWG URL standard - host', () => {
    const testUrl = new URL('https://sub.example.com/p/a/t/h?query=string#hash');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('');
    expect(testUrl.password).toBe('');
    expect(testUrl.host).toBe('sub.example.com');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('');
    expect(testUrl.origin).toBe('https://sub.example.com');
    expect(testUrl.pathname).toBe('/p/a/t/h');
    expect(testUrl.search).toBe('?query=string');
    expect(testUrl.searchParams.get('query')).toBe('string');
    expect(testUrl.hash).toBe('#hash');
    expect(testUrl.href).toBe('https://sub.example.com/p/a/t/h?query=string#hash');
});

test('WHATWG URL standard - host no hash', () => {
    const testUrl = new URL('https://sub.example.com/p/a/t/h?query=string');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('');
    expect(testUrl.password).toBe('');
    expect(testUrl.host).toBe('sub.example.com');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('');
    expect(testUrl.origin).toBe('https://sub.example.com');
    expect(testUrl.pathname).toBe('/p/a/t/h');
    expect(testUrl.search).toBe('?query=string');
    expect(testUrl.searchParams.get('query')).toBe('string');
    expect(testUrl.hash).toBe('');
    expect(testUrl.href).toBe('https://sub.example.com/p/a/t/h?query=string');
});

test('WHATWG URL standard - host domain only', () => {
    const testUrl = new URL('https://sub.example.com?query=string');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('');
    expect(testUrl.password).toBe('');
    expect(testUrl.host).toBe('sub.example.com');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('');
    expect(testUrl.origin).toBe('https://sub.example.com');
    expect(testUrl.pathname).toBe('/');
    expect(testUrl.search).toBe('?query=string');
    expect(testUrl.searchParams.get('query')).toBe('string');
    expect(testUrl.hash).toBe('');
    expect(testUrl.href).toBe('https://sub.example.com/?query=string');
});

test('WHATWG URL standard - host no query', () => {
    const testUrl = new URL('https://sub.example.com');
    expect(testUrl.protocol).toBe('https:');
    expect(testUrl.username).toBe('');
    expect(testUrl.password).toBe('');
    expect(testUrl.host).toBe('sub.example.com');
    expect(testUrl.hostname).toBe('sub.example.com');
    expect(testUrl.port).toBe('');
    expect(testUrl.origin).toBe('https://sub.example.com');
    expect(testUrl.pathname).toBe('/');
    expect(testUrl.search).toBe('');
    expect(testUrl.searchParams.get('query')).toBe(null);
    expect(testUrl.hash).toBe('');
    expect(testUrl.href).toBe('https://sub.example.com/');
});