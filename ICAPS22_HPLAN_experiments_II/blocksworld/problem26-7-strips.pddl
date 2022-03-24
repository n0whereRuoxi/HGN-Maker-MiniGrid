( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b552 - block
    b415 - block
    b260 - block
    b770 - block
    b102 - block
    b21 - block
    b54 - block
    b266 - block
    b292 - block
    b306 - block
    b678 - block
    b880 - block
    b901 - block
    b538 - block
    b295 - block
    b980 - block
    b518 - block
    b720 - block
    b385 - block
    b715 - block
    b713 - block
    b646 - block
    b614 - block
    b577 - block
    b431 - block
    b897 - block
    b530 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b415 b552 )
    ( on b260 b415 )
    ( on b770 b260 )
    ( on b102 b770 )
    ( on b21 b102 )
    ( on b54 b21 )
    ( on b266 b54 )
    ( on b292 b266 )
    ( on b306 b292 )
    ( on b678 b306 )
    ( on b880 b678 )
    ( on b901 b880 )
    ( on b538 b901 )
    ( on b295 b538 )
    ( on b980 b295 )
    ( on b518 b980 )
    ( on b720 b518 )
    ( on b385 b720 )
    ( on b715 b385 )
    ( on b713 b715 )
    ( on b646 b713 )
    ( on b614 b646 )
    ( on b577 b614 )
    ( on b431 b577 )
    ( on b897 b431 )
    ( on b530 b897 )
    ( clear b530 )
  )
  ( :goal
    ( and
      ( clear b552 )
    )
  )
)
