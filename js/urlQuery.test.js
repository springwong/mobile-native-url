test('WHATWG URL standard - basic test', () => {
    const testUrl = new URL('https://www.google.com');
    expect(testUrl.host).toBe('www.google.com');
    expect(testUrl.href).toBe('https://www.google.com/');
});

test('WHATWG URL standard - query test', () => {
    const testUrl = new URL('https://www.google.com');
    testUrl.searchParams.set('space', 'hello world');
    testUrl.searchParams.set('and', '&')
    expect(testUrl.host).toBe('www.google.com');
    expect(testUrl.search).toBe('?space=hello+world&and=%26');
    expect(testUrl.searchParams.get('space')).toBe('hello world');
    expect(testUrl.searchParams.get('and')).toBe('&');
    expect(testUrl.searchParams.get('notExist')).toBe(null);
});

test('WHATWG URL standard - query redirect url', () => {
    const testUrl = new URL('https://www.google.com');
    testUrl.searchParams.set('redirectUrl', 'https://www.apple.com.hk?space=hello+world&and=%26');
    expect(testUrl.host).toBe('www.google.com');
    expect(testUrl.search).toBe('?redirectUrl=https%3A%2F%2Fwww.apple.com.hk%3Fspace%3Dhello%2Bworld%26and%3D%2526');
    expect(testUrl.searchParams.get('redirectUrl')).toBe('https://www.apple.com.hk?space=hello+world&and=%26');
    expect(testUrl.href).toBe('https://www.google.com/?redirectUrl=https%3A%2F%2Fwww.apple.com.hk%3Fspace%3Dhello%2Bworld%26and%3D%2526');
});