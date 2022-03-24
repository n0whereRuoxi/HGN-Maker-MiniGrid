( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b759 - block
    b766 - block
    b790 - block
    b561 - block
    b997 - block
    b7 - block
    b906 - block
    b268 - block
    b618 - block
    b560 - block
    b710 - block
    b923 - block
    b437 - block
    b445 - block
    b400 - block
    b378 - block
    b506 - block
    b434 - block
    b61 - block
    b848 - block
    b612 - block
    b949 - block
    b613 - block
    b896 - block
    b313 - block
    b385 - block
    b128 - block
    b298 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b759 )
    ( on b766 b759 )
    ( on b790 b766 )
    ( on b561 b790 )
    ( on b997 b561 )
    ( on b7 b997 )
    ( on b906 b7 )
    ( on b268 b906 )
    ( on b618 b268 )
    ( on b560 b618 )
    ( on b710 b560 )
    ( on b923 b710 )
    ( on b437 b923 )
    ( on b445 b437 )
    ( on b400 b445 )
    ( on b378 b400 )
    ( on b506 b378 )
    ( on b434 b506 )
    ( on b61 b434 )
    ( on b848 b61 )
    ( on b612 b848 )
    ( on b949 b612 )
    ( on b613 b949 )
    ( on b896 b613 )
    ( on b313 b896 )
    ( on b385 b313 )
    ( on b128 b385 )
    ( on b298 b128 )
    ( clear b298 )
  )
  ( :goal
    ( and
      ( clear b759 )
    )
  )
)
