( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b49 - block
    b939 - block
    b404 - block
    b773 - block
    b222 - block
    b807 - block
    b644 - block
    b144 - block
    b546 - block
    b176 - block
    b364 - block
    b2 - block
    b111 - block
    b33 - block
    b454 - block
    b16 - block
    b355 - block
    b79 - block
    b605 - block
    b497 - block
    b604 - block
    b868 - block
    b106 - block
    b264 - block
    b910 - block
    b735 - block
    b665 - block
    b357 - block
    b618 - block
    b821 - block
    b978 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b49 )
    ( on b939 b49 )
    ( on b404 b939 )
    ( on b773 b404 )
    ( on b222 b773 )
    ( on b807 b222 )
    ( on b644 b807 )
    ( on b144 b644 )
    ( on b546 b144 )
    ( on b176 b546 )
    ( on b364 b176 )
    ( on b2 b364 )
    ( on b111 b2 )
    ( on b33 b111 )
    ( on b454 b33 )
    ( on b16 b454 )
    ( on b355 b16 )
    ( on b79 b355 )
    ( on b605 b79 )
    ( on b497 b605 )
    ( on b604 b497 )
    ( on b868 b604 )
    ( on b106 b868 )
    ( on b264 b106 )
    ( on b910 b264 )
    ( on b735 b910 )
    ( on b665 b735 )
    ( on b357 b665 )
    ( on b618 b357 )
    ( on b821 b618 )
    ( on b978 b821 )
    ( clear b978 )
  )
  ( :goal
    ( and
      ( clear b49 )
    )
  )
)
