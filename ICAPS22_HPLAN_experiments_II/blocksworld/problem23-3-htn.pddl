( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b231 - block
    b164 - block
    b54 - block
    b952 - block
    b688 - block
    b361 - block
    b910 - block
    b977 - block
    b708 - block
    b535 - block
    b448 - block
    b635 - block
    b398 - block
    b745 - block
    b174 - block
    b802 - block
    b564 - block
    b691 - block
    b133 - block
    b383 - block
    b253 - block
    b714 - block
    b47 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b231 b203 )
    ( on b164 b231 )
    ( on b54 b164 )
    ( on b952 b54 )
    ( on b688 b952 )
    ( on b361 b688 )
    ( on b910 b361 )
    ( on b977 b910 )
    ( on b708 b977 )
    ( on b535 b708 )
    ( on b448 b535 )
    ( on b635 b448 )
    ( on b398 b635 )
    ( on b745 b398 )
    ( on b174 b745 )
    ( on b802 b174 )
    ( on b564 b802 )
    ( on b691 b564 )
    ( on b133 b691 )
    ( on b383 b133 )
    ( on b253 b383 )
    ( on b714 b253 )
    ( on b47 b714 )
    ( clear b47 )
  )
  ( :tasks
    ( Make-23Pile b231 b164 b54 b952 b688 b361 b910 b977 b708 b535 b448 b635 b398 b745 b174 b802 b564 b691 b133 b383 b253 b714 b47 )
  )
)
