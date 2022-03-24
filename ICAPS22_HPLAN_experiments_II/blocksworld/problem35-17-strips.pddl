( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b259 - block
    b327 - block
    b122 - block
    b871 - block
    b743 - block
    b677 - block
    b676 - block
    b873 - block
    b938 - block
    b506 - block
    b30 - block
    b737 - block
    b549 - block
    b896 - block
    b685 - block
    b867 - block
    b636 - block
    b631 - block
    b926 - block
    b829 - block
    b884 - block
    b355 - block
    b600 - block
    b581 - block
    b121 - block
    b913 - block
    b778 - block
    b317 - block
    b948 - block
    b852 - block
    b893 - block
    b714 - block
    b14 - block
    b426 - block
    b796 - block
    b802 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b259 )
    ( on b327 b259 )
    ( on b122 b327 )
    ( on b871 b122 )
    ( on b743 b871 )
    ( on b677 b743 )
    ( on b676 b677 )
    ( on b873 b676 )
    ( on b938 b873 )
    ( on b506 b938 )
    ( on b30 b506 )
    ( on b737 b30 )
    ( on b549 b737 )
    ( on b896 b549 )
    ( on b685 b896 )
    ( on b867 b685 )
    ( on b636 b867 )
    ( on b631 b636 )
    ( on b926 b631 )
    ( on b829 b926 )
    ( on b884 b829 )
    ( on b355 b884 )
    ( on b600 b355 )
    ( on b581 b600 )
    ( on b121 b581 )
    ( on b913 b121 )
    ( on b778 b913 )
    ( on b317 b778 )
    ( on b948 b317 )
    ( on b852 b948 )
    ( on b893 b852 )
    ( on b714 b893 )
    ( on b14 b714 )
    ( on b426 b14 )
    ( on b796 b426 )
    ( on b802 b796 )
    ( clear b802 )
  )
  ( :goal
    ( and
      ( clear b259 )
    )
  )
)
