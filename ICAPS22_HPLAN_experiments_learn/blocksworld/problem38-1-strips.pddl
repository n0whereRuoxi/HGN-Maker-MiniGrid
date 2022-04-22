( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b418 - block
    b808 - block
    b308 - block
    b442 - block
    b347 - block
    b506 - block
    b154 - block
    b981 - block
    b779 - block
    b550 - block
    b64 - block
    b247 - block
    b688 - block
    b900 - block
    b709 - block
    b757 - block
    b582 - block
    b924 - block
    b553 - block
    b528 - block
    b167 - block
    b566 - block
    b505 - block
    b697 - block
    b344 - block
    b572 - block
    b378 - block
    b128 - block
    b430 - block
    b309 - block
    b122 - block
    b677 - block
    b743 - block
    b886 - block
    b680 - block
    b979 - block
    b345 - block
    b744 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b418 b403 )
    ( on b808 b418 )
    ( on b308 b808 )
    ( on b442 b308 )
    ( on b347 b442 )
    ( on b506 b347 )
    ( on b154 b506 )
    ( on b981 b154 )
    ( on b779 b981 )
    ( on b550 b779 )
    ( on b64 b550 )
    ( on b247 b64 )
    ( on b688 b247 )
    ( on b900 b688 )
    ( on b709 b900 )
    ( on b757 b709 )
    ( on b582 b757 )
    ( on b924 b582 )
    ( on b553 b924 )
    ( on b528 b553 )
    ( on b167 b528 )
    ( on b566 b167 )
    ( on b505 b566 )
    ( on b697 b505 )
    ( on b344 b697 )
    ( on b572 b344 )
    ( on b378 b572 )
    ( on b128 b378 )
    ( on b430 b128 )
    ( on b309 b430 )
    ( on b122 b309 )
    ( on b677 b122 )
    ( on b743 b677 )
    ( on b886 b743 )
    ( on b680 b886 )
    ( on b979 b680 )
    ( on b345 b979 )
    ( on b744 b345 )
    ( clear b744 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
