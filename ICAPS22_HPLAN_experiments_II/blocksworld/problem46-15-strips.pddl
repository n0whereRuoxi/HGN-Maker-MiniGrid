( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b740 - block
    b426 - block
    b110 - block
    b782 - block
    b311 - block
    b488 - block
    b510 - block
    b346 - block
    b847 - block
    b218 - block
    b658 - block
    b390 - block
    b618 - block
    b932 - block
    b609 - block
    b465 - block
    b920 - block
    b474 - block
    b170 - block
    b79 - block
    b620 - block
    b334 - block
    b393 - block
    b16 - block
    b819 - block
    b76 - block
    b606 - block
    b893 - block
    b776 - block
    b363 - block
    b201 - block
    b118 - block
    b495 - block
    b613 - block
    b371 - block
    b10 - block
    b967 - block
    b802 - block
    b315 - block
    b149 - block
    b995 - block
    b178 - block
    b122 - block
    b198 - block
    b630 - block
    b177 - block
    b61 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b426 b740 )
    ( on b110 b426 )
    ( on b782 b110 )
    ( on b311 b782 )
    ( on b488 b311 )
    ( on b510 b488 )
    ( on b346 b510 )
    ( on b847 b346 )
    ( on b218 b847 )
    ( on b658 b218 )
    ( on b390 b658 )
    ( on b618 b390 )
    ( on b932 b618 )
    ( on b609 b932 )
    ( on b465 b609 )
    ( on b920 b465 )
    ( on b474 b920 )
    ( on b170 b474 )
    ( on b79 b170 )
    ( on b620 b79 )
    ( on b334 b620 )
    ( on b393 b334 )
    ( on b16 b393 )
    ( on b819 b16 )
    ( on b76 b819 )
    ( on b606 b76 )
    ( on b893 b606 )
    ( on b776 b893 )
    ( on b363 b776 )
    ( on b201 b363 )
    ( on b118 b201 )
    ( on b495 b118 )
    ( on b613 b495 )
    ( on b371 b613 )
    ( on b10 b371 )
    ( on b967 b10 )
    ( on b802 b967 )
    ( on b315 b802 )
    ( on b149 b315 )
    ( on b995 b149 )
    ( on b178 b995 )
    ( on b122 b178 )
    ( on b198 b122 )
    ( on b630 b198 )
    ( on b177 b630 )
    ( on b61 b177 )
    ( clear b61 )
  )
  ( :goal
    ( and
      ( clear b740 )
    )
  )
)
