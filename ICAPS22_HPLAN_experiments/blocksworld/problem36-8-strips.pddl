( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b755 - block
    b701 - block
    b919 - block
    b47 - block
    b543 - block
    b496 - block
    b827 - block
    b596 - block
    b779 - block
    b835 - block
    b326 - block
    b412 - block
    b341 - block
    b200 - block
    b365 - block
    b526 - block
    b196 - block
    b417 - block
    b514 - block
    b785 - block
    b985 - block
    b793 - block
    b628 - block
    b440 - block
    b291 - block
    b878 - block
    b659 - block
    b306 - block
    b616 - block
    b193 - block
    b714 - block
    b679 - block
    b400 - block
    b119 - block
    b484 - block
    b715 - block
    b954 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b755 )
    ( on b701 b755 )
    ( on b919 b701 )
    ( on b47 b919 )
    ( on b543 b47 )
    ( on b496 b543 )
    ( on b827 b496 )
    ( on b596 b827 )
    ( on b779 b596 )
    ( on b835 b779 )
    ( on b326 b835 )
    ( on b412 b326 )
    ( on b341 b412 )
    ( on b200 b341 )
    ( on b365 b200 )
    ( on b526 b365 )
    ( on b196 b526 )
    ( on b417 b196 )
    ( on b514 b417 )
    ( on b785 b514 )
    ( on b985 b785 )
    ( on b793 b985 )
    ( on b628 b793 )
    ( on b440 b628 )
    ( on b291 b440 )
    ( on b878 b291 )
    ( on b659 b878 )
    ( on b306 b659 )
    ( on b616 b306 )
    ( on b193 b616 )
    ( on b714 b193 )
    ( on b679 b714 )
    ( on b400 b679 )
    ( on b119 b400 )
    ( on b484 b119 )
    ( on b715 b484 )
    ( on b954 b715 )
    ( clear b954 )
  )
  ( :goal
    ( and
      ( clear b755 )
    )
  )
)
