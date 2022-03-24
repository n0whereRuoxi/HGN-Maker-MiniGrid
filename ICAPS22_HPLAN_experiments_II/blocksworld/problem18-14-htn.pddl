( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b407 - block
    b665 - block
    b806 - block
    b998 - block
    b912 - block
    b896 - block
    b803 - block
    b862 - block
    b351 - block
    b125 - block
    b632 - block
    b527 - block
    b906 - block
    b728 - block
    b821 - block
    b573 - block
    b961 - block
    b836 - block
    b480 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b407 )
    ( on b665 b407 )
    ( on b806 b665 )
    ( on b998 b806 )
    ( on b912 b998 )
    ( on b896 b912 )
    ( on b803 b896 )
    ( on b862 b803 )
    ( on b351 b862 )
    ( on b125 b351 )
    ( on b632 b125 )
    ( on b527 b632 )
    ( on b906 b527 )
    ( on b728 b906 )
    ( on b821 b728 )
    ( on b573 b821 )
    ( on b961 b573 )
    ( on b836 b961 )
    ( on b480 b836 )
    ( clear b480 )
  )
  ( :tasks
    ( Make-18Pile b665 b806 b998 b912 b896 b803 b862 b351 b125 b632 b527 b906 b728 b821 b573 b961 b836 b480 )
  )
)
