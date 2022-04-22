( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b207 - block
    b930 - block
    b974 - block
    b26 - block
    b237 - block
    b361 - block
    b265 - block
    b63 - block
    b411 - block
    b913 - block
    b907 - block
    b190 - block
    b609 - block
    b481 - block
    b857 - block
    b783 - block
    b150 - block
    b853 - block
    b295 - block
    b62 - block
    b816 - block
    b750 - block
    b591 - block
    b899 - block
    b569 - block
    b578 - block
    b608 - block
    b287 - block
    b374 - block
    b3 - block
    b803 - block
    b633 - block
    b6 - block
    b970 - block
    b639 - block
    b947 - block
    b157 - block
    b380 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b207 b431 )
    ( on b930 b207 )
    ( on b974 b930 )
    ( on b26 b974 )
    ( on b237 b26 )
    ( on b361 b237 )
    ( on b265 b361 )
    ( on b63 b265 )
    ( on b411 b63 )
    ( on b913 b411 )
    ( on b907 b913 )
    ( on b190 b907 )
    ( on b609 b190 )
    ( on b481 b609 )
    ( on b857 b481 )
    ( on b783 b857 )
    ( on b150 b783 )
    ( on b853 b150 )
    ( on b295 b853 )
    ( on b62 b295 )
    ( on b816 b62 )
    ( on b750 b816 )
    ( on b591 b750 )
    ( on b899 b591 )
    ( on b569 b899 )
    ( on b578 b569 )
    ( on b608 b578 )
    ( on b287 b608 )
    ( on b374 b287 )
    ( on b3 b374 )
    ( on b803 b3 )
    ( on b633 b803 )
    ( on b6 b633 )
    ( on b970 b6 )
    ( on b639 b970 )
    ( on b947 b639 )
    ( on b157 b947 )
    ( on b380 b157 )
    ( clear b380 )
  )
  ( :goal
    ( and
      ( clear b431 )
    )
  )
)
