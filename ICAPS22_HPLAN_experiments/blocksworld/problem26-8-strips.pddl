( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b342 - block
    b934 - block
    b193 - block
    b822 - block
    b84 - block
    b119 - block
    b231 - block
    b518 - block
    b846 - block
    b762 - block
    b133 - block
    b91 - block
    b642 - block
    b48 - block
    b771 - block
    b448 - block
    b564 - block
    b420 - block
    b772 - block
    b830 - block
    b470 - block
    b675 - block
    b872 - block
    b12 - block
    b197 - block
    b648 - block
    b278 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b934 b342 )
    ( on b193 b934 )
    ( on b822 b193 )
    ( on b84 b822 )
    ( on b119 b84 )
    ( on b231 b119 )
    ( on b518 b231 )
    ( on b846 b518 )
    ( on b762 b846 )
    ( on b133 b762 )
    ( on b91 b133 )
    ( on b642 b91 )
    ( on b48 b642 )
    ( on b771 b48 )
    ( on b448 b771 )
    ( on b564 b448 )
    ( on b420 b564 )
    ( on b772 b420 )
    ( on b830 b772 )
    ( on b470 b830 )
    ( on b675 b470 )
    ( on b872 b675 )
    ( on b12 b872 )
    ( on b197 b12 )
    ( on b648 b197 )
    ( on b278 b648 )
    ( clear b278 )
  )
  ( :goal
    ( and
      ( clear b342 )
    )
  )
)
