( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b570 - block
    b173 - block
    b105 - block
    b124 - block
    b321 - block
    b62 - block
    b263 - block
    b772 - block
    b57 - block
    b291 - block
    b334 - block
    b435 - block
    b865 - block
    b294 - block
    b649 - block
    b448 - block
    b202 - block
    b292 - block
    b398 - block
    b859 - block
    b478 - block
    b744 - block
    b207 - block
    b346 - block
    b959 - block
    b208 - block
    b327 - block
    b542 - block
    b512 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b570 b226 )
    ( on b173 b570 )
    ( on b105 b173 )
    ( on b124 b105 )
    ( on b321 b124 )
    ( on b62 b321 )
    ( on b263 b62 )
    ( on b772 b263 )
    ( on b57 b772 )
    ( on b291 b57 )
    ( on b334 b291 )
    ( on b435 b334 )
    ( on b865 b435 )
    ( on b294 b865 )
    ( on b649 b294 )
    ( on b448 b649 )
    ( on b202 b448 )
    ( on b292 b202 )
    ( on b398 b292 )
    ( on b859 b398 )
    ( on b478 b859 )
    ( on b744 b478 )
    ( on b207 b744 )
    ( on b346 b207 )
    ( on b959 b346 )
    ( on b208 b959 )
    ( on b327 b208 )
    ( on b542 b327 )
    ( on b512 b542 )
    ( on b473 b512 )
    ( clear b473 )
  )
  ( :tasks
    ( Make-30Pile b570 b173 b105 b124 b321 b62 b263 b772 b57 b291 b334 b435 b865 b294 b649 b448 b202 b292 b398 b859 b478 b744 b207 b346 b959 b208 b327 b542 b512 b473 )
  )
)
