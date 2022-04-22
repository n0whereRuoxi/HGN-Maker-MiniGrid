( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b577 - block
    b792 - block
    b590 - block
    b119 - block
    b998 - block
    b977 - block
    b567 - block
    b685 - block
    b808 - block
    b701 - block
    b129 - block
    b974 - block
    b354 - block
    b243 - block
    b712 - block
    b236 - block
    b43 - block
    b308 - block
    b183 - block
    b713 - block
    b908 - block
    b460 - block
    b5 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b577 )
    ( on b792 b577 )
    ( on b590 b792 )
    ( on b119 b590 )
    ( on b998 b119 )
    ( on b977 b998 )
    ( on b567 b977 )
    ( on b685 b567 )
    ( on b808 b685 )
    ( on b701 b808 )
    ( on b129 b701 )
    ( on b974 b129 )
    ( on b354 b974 )
    ( on b243 b354 )
    ( on b712 b243 )
    ( on b236 b712 )
    ( on b43 b236 )
    ( on b308 b43 )
    ( on b183 b308 )
    ( on b713 b183 )
    ( on b908 b713 )
    ( on b460 b908 )
    ( on b5 b460 )
    ( on b70 b5 )
    ( clear b70 )
  )
  ( :goal
    ( and
      ( clear b577 )
    )
  )
)
