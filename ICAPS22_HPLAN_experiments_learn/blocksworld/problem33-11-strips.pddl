( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b94 - block
    b73 - block
    b272 - block
    b740 - block
    b426 - block
    b889 - block
    b359 - block
    b122 - block
    b394 - block
    b309 - block
    b738 - block
    b543 - block
    b322 - block
    b790 - block
    b703 - block
    b93 - block
    b618 - block
    b41 - block
    b130 - block
    b437 - block
    b39 - block
    b610 - block
    b993 - block
    b591 - block
    b366 - block
    b329 - block
    b837 - block
    b501 - block
    b404 - block
    b455 - block
    b444 - block
    b320 - block
    b709 - block
    b805 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b94 )
    ( on b73 b94 )
    ( on b272 b73 )
    ( on b740 b272 )
    ( on b426 b740 )
    ( on b889 b426 )
    ( on b359 b889 )
    ( on b122 b359 )
    ( on b394 b122 )
    ( on b309 b394 )
    ( on b738 b309 )
    ( on b543 b738 )
    ( on b322 b543 )
    ( on b790 b322 )
    ( on b703 b790 )
    ( on b93 b703 )
    ( on b618 b93 )
    ( on b41 b618 )
    ( on b130 b41 )
    ( on b437 b130 )
    ( on b39 b437 )
    ( on b610 b39 )
    ( on b993 b610 )
    ( on b591 b993 )
    ( on b366 b591 )
    ( on b329 b366 )
    ( on b837 b329 )
    ( on b501 b837 )
    ( on b404 b501 )
    ( on b455 b404 )
    ( on b444 b455 )
    ( on b320 b444 )
    ( on b709 b320 )
    ( on b805 b709 )
    ( clear b805 )
  )
  ( :goal
    ( and
      ( clear b94 )
    )
  )
)
