import { Context } from './Context';
declare class XkcdComicsError extends Error {
    isXkcdComicsError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { XkcdComicsError };
