( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b398 - block
    b659 - block
    b747 - block
    b177 - block
    b207 - block
    b67 - block
    b971 - block
    b335 - block
    b725 - block
    b675 - block
    b734 - block
    b589 - block
    b423 - block
    b748 - block
    b417 - block
    b550 - block
    b465 - block
    b112 - block
    b806 - block
    b935 - block
    b576 - block
    b122 - block
    b160 - block
    b434 - block
    b668 - block
    b818 - block
    b220 - block
    b275 - block
    b363 - block
    b954 - block
    b147 - block
    b325 - block
    b58 - block
    b753 - block
    b736 - block
    b166 - block
    b43 - block
    b520 - block
    b33 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b398 )
    ( on b659 b398 )
    ( on b747 b659 )
    ( on b177 b747 )
    ( on b207 b177 )
    ( on b67 b207 )
    ( on b971 b67 )
    ( on b335 b971 )
    ( on b725 b335 )
    ( on b675 b725 )
    ( on b734 b675 )
    ( on b589 b734 )
    ( on b423 b589 )
    ( on b748 b423 )
    ( on b417 b748 )
    ( on b550 b417 )
    ( on b465 b550 )
    ( on b112 b465 )
    ( on b806 b112 )
    ( on b935 b806 )
    ( on b576 b935 )
    ( on b122 b576 )
    ( on b160 b122 )
    ( on b434 b160 )
    ( on b668 b434 )
    ( on b818 b668 )
    ( on b220 b818 )
    ( on b275 b220 )
    ( on b363 b275 )
    ( on b954 b363 )
    ( on b147 b954 )
    ( on b325 b147 )
    ( on b58 b325 )
    ( on b753 b58 )
    ( on b736 b753 )
    ( on b166 b736 )
    ( on b43 b166 )
    ( on b520 b43 )
    ( on b33 b520 )
    ( clear b33 )
  )
  ( :tasks
    ( Make-38Pile b659 b747 b177 b207 b67 b971 b335 b725 b675 b734 b589 b423 b748 b417 b550 b465 b112 b806 b935 b576 b122 b160 b434 b668 b818 b220 b275 b363 b954 b147 b325 b58 b753 b736 b166 b43 b520 b33 )
  )
)
