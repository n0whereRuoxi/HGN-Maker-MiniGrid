( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b222 - block
    b749 - block
    b826 - block
    b725 - block
    b643 - block
    b154 - block
    b838 - block
    b791 - block
    b668 - block
    b851 - block
    b824 - block
    b27 - block
    b896 - block
    b473 - block
    b690 - block
    b735 - block
    b615 - block
    b874 - block
    b984 - block
    b540 - block
    b207 - block
    b107 - block
    b822 - block
    b316 - block
    b210 - block
    b477 - block
    b487 - block
    b882 - block
    b39 - block
    b658 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b222 )
    ( on b749 b222 )
    ( on b826 b749 )
    ( on b725 b826 )
    ( on b643 b725 )
    ( on b154 b643 )
    ( on b838 b154 )
    ( on b791 b838 )
    ( on b668 b791 )
    ( on b851 b668 )
    ( on b824 b851 )
    ( on b27 b824 )
    ( on b896 b27 )
    ( on b473 b896 )
    ( on b690 b473 )
    ( on b735 b690 )
    ( on b615 b735 )
    ( on b874 b615 )
    ( on b984 b874 )
    ( on b540 b984 )
    ( on b207 b540 )
    ( on b107 b207 )
    ( on b822 b107 )
    ( on b316 b822 )
    ( on b210 b316 )
    ( on b477 b210 )
    ( on b487 b477 )
    ( on b882 b487 )
    ( on b39 b882 )
    ( on b658 b39 )
    ( clear b658 )
  )
  ( :tasks
    ( Make-29Pile b749 b826 b725 b643 b154 b838 b791 b668 b851 b824 b27 b896 b473 b690 b735 b615 b874 b984 b540 b207 b107 b822 b316 b210 b477 b487 b882 b39 b658 )
  )
)
