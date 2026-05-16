package core

type XkcdComicsError struct {
	IsXkcdComicsError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewXkcdComicsError(code string, msg string, ctx *Context) *XkcdComicsError {
	return &XkcdComicsError{
		IsXkcdComicsError: true,
		Sdk:              "XkcdComics",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *XkcdComicsError) Error() string {
	return e.Msg
}
