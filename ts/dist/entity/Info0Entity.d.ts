import { XkcdComicsEntityBase } from '../XkcdComicsEntityBase';
import type { XkcdComicsSDK } from '../XkcdComicsSDK';
import type { Control } from '../types';
import type { Info0, Info0LoadMatch } from '../XkcdComicsTypes';
declare class Info0Entity extends XkcdComicsEntityBase<Info0> {
    constructor(client: XkcdComicsSDK, entopts: any);
    make(this: Info0Entity): Info0Entity;
    load(this: any, reqmatch?: Info0LoadMatch, ctrl?: Control): Promise<Info0Entity>;
}
export { Info0Entity };
