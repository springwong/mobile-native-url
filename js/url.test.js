const url = require('url');

test('WHATWG URL standard', () => {
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