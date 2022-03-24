( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b296 - block
    b101 - block
    b222 - block
    b271 - block
    b358 - block
    b779 - block
    b178 - block
    b859 - block
    b655 - block
    b875 - block
    b913 - block
    b301 - block
    b937 - block
    b454 - block
    b755 - block
    b305 - block
    b363 - block
    b699 - block
    b708 - block
    b334 - block
    b242 - block
    b692 - block
    b705 - block
    b170 - block
    b255 - block
    b997 - block
    b59 - block
    b573 - block
    b347 - block
    b370 - block
    b484 - block
    b458 - block
    b842 - block
    b981 - block
    b392 - block
    b810 - block
    b507 - block
    b960 - block
    b975 - block
    b760 - block
    b83 - block
    b728 - block
    b848 - block
    b872 - block
    b954 - block
    b680 - block
    b595 - block
    b965 - block
    b602 - block
    b799 - block
    b933 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b296 )
    ( on b101 b296 )
    ( on b222 b101 )
    ( on b271 b222 )
    ( on b358 b271 )
    ( on b779 b358 )
    ( on b178 b779 )
    ( on b859 b178 )
    ( on b655 b859 )
    ( on b875 b655 )
    ( on b913 b875 )
    ( on b301 b913 )
    ( on b937 b301 )
    ( on b454 b937 )
    ( on b755 b454 )
    ( on b305 b755 )
    ( on b363 b305 )
    ( on b699 b363 )
    ( on b708 b699 )
    ( on b334 b708 )
    ( on b242 b334 )
    ( on b692 b242 )
    ( on b705 b692 )
    ( on b170 b705 )
    ( on b255 b170 )
    ( on b997 b255 )
    ( on b59 b997 )
    ( on b573 b59 )
    ( on b347 b573 )
    ( on b370 b347 )
    ( on b484 b370 )
    ( on b458 b484 )
    ( on b842 b458 )
    ( on b981 b842 )
    ( on b392 b981 )
    ( on b810 b392 )
    ( on b507 b810 )
    ( on b960 b507 )
    ( on b975 b960 )
    ( on b760 b975 )
    ( on b83 b760 )
    ( on b728 b83 )
    ( on b848 b728 )
    ( on b872 b848 )
    ( on b954 b872 )
    ( on b680 b954 )
    ( on b595 b680 )
    ( on b965 b595 )
    ( on b602 b965 )
    ( on b799 b602 )
    ( on b933 b799 )
    ( clear b933 )
  )
  ( :tasks
    ( Make-50Pile b101 b222 b271 b358 b779 b178 b859 b655 b875 b913 b301 b937 b454 b755 b305 b363 b699 b708 b334 b242 b692 b705 b170 b255 b997 b59 b573 b347 b370 b484 b458 b842 b981 b392 b810 b507 b960 b975 b760 b83 b728 b848 b872 b954 b680 b595 b965 b602 b799 b933 )
  )
)
