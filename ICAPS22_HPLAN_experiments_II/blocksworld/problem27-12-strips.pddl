( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b303 - block
    b510 - block
    b181 - block
    b374 - block
    b70 - block
    b128 - block
    b884 - block
    b912 - block
    b233 - block
    b619 - block
    b137 - block
    b26 - block
    b870 - block
    b308 - block
    b365 - block
    b961 - block
    b323 - block
    b98 - block
    b161 - block
    b39 - block
    b267 - block
    b5 - block
    b362 - block
    b890 - block
    b757 - block
    b562 - block
    b389 - block
    b739 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b303 )
    ( on b510 b303 )
    ( on b181 b510 )
    ( on b374 b181 )
    ( on b70 b374 )
    ( on b128 b70 )
    ( on b884 b128 )
    ( on b912 b884 )
    ( on b233 b912 )
    ( on b619 b233 )
    ( on b137 b619 )
    ( on b26 b137 )
    ( on b870 b26 )
    ( on b308 b870 )
    ( on b365 b308 )
    ( on b961 b365 )
    ( on b323 b961 )
    ( on b98 b323 )
    ( on b161 b98 )
    ( on b39 b161 )
    ( on b267 b39 )
    ( on b5 b267 )
    ( on b362 b5 )
    ( on b890 b362 )
    ( on b757 b890 )
    ( on b562 b757 )
    ( on b389 b562 )
    ( on b739 b389 )
    ( clear b739 )
  )
  ( :goal
    ( and
      ( clear b303 )
    )
  )
)
