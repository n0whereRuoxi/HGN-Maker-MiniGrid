( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b643 - block
    b479 - block
    b651 - block
    b430 - block
    b583 - block
    b649 - block
    b529 - block
    b833 - block
    b780 - block
    b90 - block
    b93 - block
    b772 - block
    b704 - block
    b740 - block
    b91 - block
    b758 - block
    b87 - block
    b610 - block
    b788 - block
    b779 - block
    b872 - block
    b215 - block
    b79 - block
    b767 - block
    b312 - block
    b160 - block
    b909 - block
    b777 - block
    b371 - block
    b52 - block
    b346 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b643 )
    ( on b479 b643 )
    ( on b651 b479 )
    ( on b430 b651 )
    ( on b583 b430 )
    ( on b649 b583 )
    ( on b529 b649 )
    ( on b833 b529 )
    ( on b780 b833 )
    ( on b90 b780 )
    ( on b93 b90 )
    ( on b772 b93 )
    ( on b704 b772 )
    ( on b740 b704 )
    ( on b91 b740 )
    ( on b758 b91 )
    ( on b87 b758 )
    ( on b610 b87 )
    ( on b788 b610 )
    ( on b779 b788 )
    ( on b872 b779 )
    ( on b215 b872 )
    ( on b79 b215 )
    ( on b767 b79 )
    ( on b312 b767 )
    ( on b160 b312 )
    ( on b909 b160 )
    ( on b777 b909 )
    ( on b371 b777 )
    ( on b52 b371 )
    ( on b346 b52 )
    ( clear b346 )
  )
  ( :tasks
    ( Make-30Pile b479 b651 b430 b583 b649 b529 b833 b780 b90 b93 b772 b704 b740 b91 b758 b87 b610 b788 b779 b872 b215 b79 b767 b312 b160 b909 b777 b371 b52 b346 )
  )
)
