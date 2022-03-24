( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b991 - block
    b306 - block
    b402 - block
    b745 - block
    b774 - block
    b177 - block
    b34 - block
    b405 - block
    b799 - block
    b86 - block
    b31 - block
    b70 - block
    b923 - block
    b938 - block
    b788 - block
    b483 - block
    b714 - block
    b8 - block
    b857 - block
    b677 - block
    b292 - block
    b777 - block
    b342 - block
    b591 - block
    b687 - block
    b451 - block
    b755 - block
    b507 - block
    b63 - block
    b375 - block
    b210 - block
    b887 - block
    b172 - block
    b122 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b991 b226 )
    ( on b306 b991 )
    ( on b402 b306 )
    ( on b745 b402 )
    ( on b774 b745 )
    ( on b177 b774 )
    ( on b34 b177 )
    ( on b405 b34 )
    ( on b799 b405 )
    ( on b86 b799 )
    ( on b31 b86 )
    ( on b70 b31 )
    ( on b923 b70 )
    ( on b938 b923 )
    ( on b788 b938 )
    ( on b483 b788 )
    ( on b714 b483 )
    ( on b8 b714 )
    ( on b857 b8 )
    ( on b677 b857 )
    ( on b292 b677 )
    ( on b777 b292 )
    ( on b342 b777 )
    ( on b591 b342 )
    ( on b687 b591 )
    ( on b451 b687 )
    ( on b755 b451 )
    ( on b507 b755 )
    ( on b63 b507 )
    ( on b375 b63 )
    ( on b210 b375 )
    ( on b887 b210 )
    ( on b172 b887 )
    ( on b122 b172 )
    ( clear b122 )
  )
  ( :tasks
    ( Make-34Pile b991 b306 b402 b745 b774 b177 b34 b405 b799 b86 b31 b70 b923 b938 b788 b483 b714 b8 b857 b677 b292 b777 b342 b591 b687 b451 b755 b507 b63 b375 b210 b887 b172 b122 )
  )
)
