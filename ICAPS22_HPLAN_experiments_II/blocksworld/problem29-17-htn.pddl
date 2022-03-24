( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b735 - block
    b142 - block
    b68 - block
    b432 - block
    b128 - block
    b477 - block
    b509 - block
    b615 - block
    b259 - block
    b784 - block
    b564 - block
    b275 - block
    b851 - block
    b255 - block
    b588 - block
    b135 - block
    b680 - block
    b522 - block
    b911 - block
    b183 - block
    b296 - block
    b99 - block
    b360 - block
    b937 - block
    b826 - block
    b401 - block
    b285 - block
    b190 - block
    b926 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b735 b848 )
    ( on b142 b735 )
    ( on b68 b142 )
    ( on b432 b68 )
    ( on b128 b432 )
    ( on b477 b128 )
    ( on b509 b477 )
    ( on b615 b509 )
    ( on b259 b615 )
    ( on b784 b259 )
    ( on b564 b784 )
    ( on b275 b564 )
    ( on b851 b275 )
    ( on b255 b851 )
    ( on b588 b255 )
    ( on b135 b588 )
    ( on b680 b135 )
    ( on b522 b680 )
    ( on b911 b522 )
    ( on b183 b911 )
    ( on b296 b183 )
    ( on b99 b296 )
    ( on b360 b99 )
    ( on b937 b360 )
    ( on b826 b937 )
    ( on b401 b826 )
    ( on b285 b401 )
    ( on b190 b285 )
    ( on b926 b190 )
    ( clear b926 )
  )
  ( :tasks
    ( Make-29Pile b735 b142 b68 b432 b128 b477 b509 b615 b259 b784 b564 b275 b851 b255 b588 b135 b680 b522 b911 b183 b296 b99 b360 b937 b826 b401 b285 b190 b926 )
  )
)
