( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b964 - block
    b255 - block
    b54 - block
    b435 - block
    b766 - block
    b447 - block
    b401 - block
    b607 - block
    b614 - block
    b636 - block
    b991 - block
    b966 - block
    b364 - block
    b336 - block
    b621 - block
    b703 - block
    b832 - block
    b403 - block
    b438 - block
    b674 - block
    b495 - block
    b527 - block
    b184 - block
    b77 - block
    b501 - block
    b197 - block
    b827 - block
    b664 - block
    b971 - block
    b872 - block
    b846 - block
    b142 - block
    b514 - block
    b725 - block
    b633 - block
    b222 - block
    b86 - block
    b521 - block
    b428 - block
    b893 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b964 )
    ( on b255 b964 )
    ( on b54 b255 )
    ( on b435 b54 )
    ( on b766 b435 )
    ( on b447 b766 )
    ( on b401 b447 )
    ( on b607 b401 )
    ( on b614 b607 )
    ( on b636 b614 )
    ( on b991 b636 )
    ( on b966 b991 )
    ( on b364 b966 )
    ( on b336 b364 )
    ( on b621 b336 )
    ( on b703 b621 )
    ( on b832 b703 )
    ( on b403 b832 )
    ( on b438 b403 )
    ( on b674 b438 )
    ( on b495 b674 )
    ( on b527 b495 )
    ( on b184 b527 )
    ( on b77 b184 )
    ( on b501 b77 )
    ( on b197 b501 )
    ( on b827 b197 )
    ( on b664 b827 )
    ( on b971 b664 )
    ( on b872 b971 )
    ( on b846 b872 )
    ( on b142 b846 )
    ( on b514 b142 )
    ( on b725 b514 )
    ( on b633 b725 )
    ( on b222 b633 )
    ( on b86 b222 )
    ( on b521 b86 )
    ( on b428 b521 )
    ( on b893 b428 )
    ( clear b893 )
  )
  ( :goal
    ( and
      ( clear b964 )
    )
  )
)
