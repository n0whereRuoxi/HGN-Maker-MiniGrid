( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b495 - block
    b730 - block
    b119 - block
    b744 - block
    b145 - block
    b521 - block
    b667 - block
    b757 - block
    b929 - block
    b939 - block
    b106 - block
    b973 - block
    b252 - block
    b936 - block
    b287 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b495 )
    ( on b730 b495 )
    ( on b119 b730 )
    ( on b744 b119 )
    ( on b145 b744 )
    ( on b521 b145 )
    ( on b667 b521 )
    ( on b757 b667 )
    ( on b929 b757 )
    ( on b939 b929 )
    ( on b106 b939 )
    ( on b973 b106 )
    ( on b252 b973 )
    ( on b936 b252 )
    ( on b287 b936 )
    ( on b444 b287 )
    ( clear b444 )
  )
  ( :tasks
    ( Make-15Pile b730 b119 b744 b145 b521 b667 b757 b929 b939 b106 b973 b252 b936 b287 b444 )
  )
)
