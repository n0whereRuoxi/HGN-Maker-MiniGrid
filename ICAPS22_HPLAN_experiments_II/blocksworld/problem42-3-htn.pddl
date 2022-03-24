( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b204 - block
    b535 - block
    b264 - block
    b55 - block
    b571 - block
    b414 - block
    b341 - block
    b196 - block
    b605 - block
    b214 - block
    b889 - block
    b987 - block
    b3 - block
    b595 - block
    b501 - block
    b201 - block
    b409 - block
    b4 - block
    b168 - block
    b189 - block
    b143 - block
    b172 - block
    b701 - block
    b694 - block
    b30 - block
    b221 - block
    b540 - block
    b303 - block
    b362 - block
    b385 - block
    b74 - block
    b372 - block
    b826 - block
    b778 - block
    b223 - block
    b431 - block
    b618 - block
    b940 - block
    b790 - block
    b355 - block
    b539 - block
    b160 - block
    b97 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b204 )
    ( on b535 b204 )
    ( on b264 b535 )
    ( on b55 b264 )
    ( on b571 b55 )
    ( on b414 b571 )
    ( on b341 b414 )
    ( on b196 b341 )
    ( on b605 b196 )
    ( on b214 b605 )
    ( on b889 b214 )
    ( on b987 b889 )
    ( on b3 b987 )
    ( on b595 b3 )
    ( on b501 b595 )
    ( on b201 b501 )
    ( on b409 b201 )
    ( on b4 b409 )
    ( on b168 b4 )
    ( on b189 b168 )
    ( on b143 b189 )
    ( on b172 b143 )
    ( on b701 b172 )
    ( on b694 b701 )
    ( on b30 b694 )
    ( on b221 b30 )
    ( on b540 b221 )
    ( on b303 b540 )
    ( on b362 b303 )
    ( on b385 b362 )
    ( on b74 b385 )
    ( on b372 b74 )
    ( on b826 b372 )
    ( on b778 b826 )
    ( on b223 b778 )
    ( on b431 b223 )
    ( on b618 b431 )
    ( on b940 b618 )
    ( on b790 b940 )
    ( on b355 b790 )
    ( on b539 b355 )
    ( on b160 b539 )
    ( on b97 b160 )
    ( clear b97 )
  )
  ( :tasks
    ( Make-42Pile b535 b264 b55 b571 b414 b341 b196 b605 b214 b889 b987 b3 b595 b501 b201 b409 b4 b168 b189 b143 b172 b701 b694 b30 b221 b540 b303 b362 b385 b74 b372 b826 b778 b223 b431 b618 b940 b790 b355 b539 b160 b97 )
  )
)
