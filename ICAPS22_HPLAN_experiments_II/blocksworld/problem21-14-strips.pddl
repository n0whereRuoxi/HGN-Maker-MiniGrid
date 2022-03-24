( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b468 - block
    b357 - block
    b579 - block
    b948 - block
    b243 - block
    b770 - block
    b191 - block
    b871 - block
    b713 - block
    b322 - block
    b929 - block
    b430 - block
    b79 - block
    b317 - block
    b716 - block
    b551 - block
    b18 - block
    b422 - block
    b901 - block
    b866 - block
    b169 - block
    b611 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b468 )
    ( on b357 b468 )
    ( on b579 b357 )
    ( on b948 b579 )
    ( on b243 b948 )
    ( on b770 b243 )
    ( on b191 b770 )
    ( on b871 b191 )
    ( on b713 b871 )
    ( on b322 b713 )
    ( on b929 b322 )
    ( on b430 b929 )
    ( on b79 b430 )
    ( on b317 b79 )
    ( on b716 b317 )
    ( on b551 b716 )
    ( on b18 b551 )
    ( on b422 b18 )
    ( on b901 b422 )
    ( on b866 b901 )
    ( on b169 b866 )
    ( on b611 b169 )
    ( clear b611 )
  )
  ( :goal
    ( and
      ( clear b468 )
    )
  )
)
