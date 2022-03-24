( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b128 - block
    b745 - block
    b975 - block
    b944 - block
    b788 - block
    b328 - block
    b513 - block
    b642 - block
    b818 - block
    b591 - block
    b337 - block
    b553 - block
    b10 - block
    b282 - block
    b117 - block
    b224 - block
    b636 - block
    b653 - block
    b183 - block
    b595 - block
    b588 - block
    b428 - block
    b181 - block
    b144 - block
    b442 - block
    b765 - block
    b333 - block
    b226 - block
    b66 - block
    b235 - block
    b122 - block
    b387 - block
    b178 - block
    b747 - block
    b577 - block
    b870 - block
    b857 - block
    b69 - block
    b309 - block
    b940 - block
    b719 - block
    b207 - block
    b334 - block
    b742 - block
    b836 - block
    b237 - block
    b240 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b128 )
    ( on b745 b128 )
    ( on b975 b745 )
    ( on b944 b975 )
    ( on b788 b944 )
    ( on b328 b788 )
    ( on b513 b328 )
    ( on b642 b513 )
    ( on b818 b642 )
    ( on b591 b818 )
    ( on b337 b591 )
    ( on b553 b337 )
    ( on b10 b553 )
    ( on b282 b10 )
    ( on b117 b282 )
    ( on b224 b117 )
    ( on b636 b224 )
    ( on b653 b636 )
    ( on b183 b653 )
    ( on b595 b183 )
    ( on b588 b595 )
    ( on b428 b588 )
    ( on b181 b428 )
    ( on b144 b181 )
    ( on b442 b144 )
    ( on b765 b442 )
    ( on b333 b765 )
    ( on b226 b333 )
    ( on b66 b226 )
    ( on b235 b66 )
    ( on b122 b235 )
    ( on b387 b122 )
    ( on b178 b387 )
    ( on b747 b178 )
    ( on b577 b747 )
    ( on b870 b577 )
    ( on b857 b870 )
    ( on b69 b857 )
    ( on b309 b69 )
    ( on b940 b309 )
    ( on b719 b940 )
    ( on b207 b719 )
    ( on b334 b207 )
    ( on b742 b334 )
    ( on b836 b742 )
    ( on b237 b836 )
    ( on b240 b237 )
    ( clear b240 )
  )
  ( :tasks
    ( Make-46Pile b745 b975 b944 b788 b328 b513 b642 b818 b591 b337 b553 b10 b282 b117 b224 b636 b653 b183 b595 b588 b428 b181 b144 b442 b765 b333 b226 b66 b235 b122 b387 b178 b747 b577 b870 b857 b69 b309 b940 b719 b207 b334 b742 b836 b237 b240 )
  )
)
